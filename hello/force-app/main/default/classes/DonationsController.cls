public with sharing class DonationsController {
	//@AuraEnabled
   // public static List<Donation__c> getDonations() {
      //  return [SELECT Id, Name, Amount__c, Donation_Date__c, Note__c
           //     FROM Donation__c];
   // }
    @AuraEnabled
    public static void saveDonation (Donation__c newDonation){
        system.debug(newDonation);
       
            System.debug('DonationsController::saveDonation::newDonation'+newDonation);
            
          
                insert newDonation;
                 System.debug('It went in ' + newDonation.Id);
            }
            
     @AuraEnabled
    public static Double gettotalAmount(){
        List<Donation__c> listDonations = [SELECT Id, Amount__c FROM Donation__c];
        Double sumDonations = 0;
        for(Donation__c donation : listDonations){
            sumDonations = sumDonations + donation.Amount__c;
        }
        return sumDonations;
    }
     @AuraEnabled
    public static List<Donation__c> topFiveClass(){
        return [SELECT Id, Name, Amount__c FROM Donation__c ORDER BY Amount__c DESC LIMIT 5];
    }
        
    }