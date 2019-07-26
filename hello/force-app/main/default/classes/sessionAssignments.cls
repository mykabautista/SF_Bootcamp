public class sessionAssignments {
    
    List<My_Assignments__c> myAss = [SELECT Session__c, Speaker__c From My_Assignments__c];

}