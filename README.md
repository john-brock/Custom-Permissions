custom-perm-demo
================

Demo using custom perms to control button access

1) download repo as zip file<br/>
2) upload zip using workbench into org<br/>
3) assign the CustomPermDemo permset to your user (grants access to Apex class and VF page)<br/>
4) assign custom permission permsets to user which will grant access to 1 or both buttons<br/>
<br/>
Navigate to page: /apex/CustomPermPage<br/>
1) buttons will only show if user has custom perms assigned<br/>
2) button will only successfully "click" if ButtonX_Click custom perm assigned<br/>
