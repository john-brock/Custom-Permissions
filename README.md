Custom Permission Demo
================

Demo using custom perms to control button access

<strong>Install Instructions</strong><br/>
1) download repo as zip file (button to the right >)<br/>
2) upload zip using workbench into org<br/>
3) assign the CustomPermDemo permset to your user (grants access to Apex class and VF page)<br/>
4) assign custom permission permsets to user which will grant access to 1 or both buttons<br/>
<br/>
<strong>Demo Info</strong><br/>
Navigate to page: `https://login.salesforce.com/apex/CustomPermPage`<br/>
1) buttons will only show if user has custom perms assigned<br/>
2) button will only successfully "click" if ButtonX_Click custom perm assigned<br/>
