/*
 * @author jbrock
 * 2/14/14
 *
 * Demonstrate custom permissions controlling access on buttons
 * visualforce page: CustomPermPage
 */
public with sharing class CustomPermButtons{

    public boolean hasButton1{get;set;}
    public boolean hasButton2{get;set;}
    public boolean hasButton1_click{get;set;}
    public boolean hasButton2_click{get;set;}
    
    public String buttonText{get;set;}
    
    private static String BUTTON1 = 'Button1';
    private static String BUTTON2 = 'Button2';
    private static String BUTTON1_CLICK = 'Button1_Click';
    private static String BUTTON2_CLICK = 'Button2_Click';
    
    Id userId;
    List<SetupEntityAccess> access;
    List<CustomPermission> customPerms;
    
    public CustomPermButtons() {
        userId = UserInfo.getUserId();
        access =[SELECT SetupEntityId FROM SetupEntityAccess WHERE SetupEntityType='CustomPermission' AND ParentId IN (SELECT PermissionSetId FROM PermissionSetAssignment WHERE AssigneeId=:userId)];
        Set<Id> customPermIds = new Set<Id>();
        for (SetupEntityAccess sea : access) {
            customPermIds.add(sea.SetupEntityId);
        }
        customPerms = [SELECT Id, DeveloperName, MasterLabel FROM CustomPermission WHERE Id IN :customPermIds];
        
        hasButton1 = checkAccess(BUTTON1);
        hasButton2 = checkAccess(BUTTON2);
        hasButton1_click = checkAccess(BUTTON1_CLICK);
        hasButton2_click = checkAccess(BUTTON2_CLICK);
    }
    
    private boolean checkAccess(String devName) {
        for (CustomPermission perm : customPerms) {
            if (perm.DeveloperName.equals(devName)) return true;
        }
        return false;
    }
    
    public void pressButton1() {
        pressButton(BUTTON1_CLICK, BUTTON1);
    }
    
    public void pressButton2() {
        pressButton(BUTTON2_CLICK, BUTTON2);
    }
    
    private void pressButton(String buttonAccessCheck, String buttonName) {
        if (checkAccess(buttonAccessCheck)) {
            buttonText = buttonName + ' Pressed!';
        } else {
            buttonText = '';
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL,'Oops, you do not have access to click button: ' + buttonName);
            ApexPages.addMessage(myMsg);
        }
    }
}