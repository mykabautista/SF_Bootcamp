public class MyAssignment_triggerHandler {
    
  public static void onAfterInsert(Map<Id,My_Assignments__c> AssignmentMap) {
        checkAssignment(AssignmentMap);
    }
    
    public static void onBeforeUpdate(Map<Id,My_Assignments__c> AssignmentMap) {
        checkAssignment(AssignmentMap);
    }
    
    private static void checkAssignment(Map<Id,My_Assignments__c> AssignmentMap) {
   		Set<DateTime> startDateSet = new Set<DateTime>();
        Set<DateTime> endDateSet = new Set<DateTime>();
        Set<Id> speakerSet = new Set<Id>();
                
        List<My_Assignments__c> assignList = new List<My_Assignments__c>(
            [SELECT Id,Speaker__c, Session__r.Start_Date_Time__c,Session__r.End_Date_Time__c FROM My_Assignments__c WHERE Id IN :AssignmentMap.keySet()]);
        for(My_Assignments__c assignment : assignList) {
            startDateSet.add(assignment.Session__r.Start_Date_Time__c);
            endDateSet.add(assignment.Session__r.End_Date_Time__c);
            speakerSet.add(assignment.Speaker__c);
        }
    }
}