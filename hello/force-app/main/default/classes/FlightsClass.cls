public with sharing class FlightsClass {
    @AuraEnabled
    public static List <Flight__c> fetchFlight(String flyFrom, String flyTo, Date dDate) {
        try{
            return [SELECT Id, Name, Flight_Number__c, 
                    Flying_From__c, Flying_To__c, Departure_Time__c, Join_Flights__c,
                    Departure_Date__c, Arrival_Time__c, Available_Seats__c, Fly_Only__c FROM Flight__c 
                    WHERE Flying_From__c =: flyFrom AND Flying_To__c =: flyTo AND Departure_Date__c =: dDate];
        }
        catch (Exception e) {
            throw new AuraHandledException('Something went wrong: '+ e.getMessage());   
        }
    }
    
    @AuraEnabled
    public static Id contactDetails(String conFirst, String conLast, String conEmail, ID flightId) {
        List<Contact> conList = [SELECT FirstName, LastName, Email FROM Contact WHERE Email =: conEmail];
        
        Contact cont = new Contact();
        Booking__c booking = new Booking__c();
        system.debug('matched contact: ' + conList.size());
        if(conList.isEmpty()){
            cont.FirstName=conFirst;
            cont.LastName=conLast;
            cont.Email=conEmail;
            try{
                insert cont;
                booking.Contact__c = cont.Id;
            }catch (Exception e) {
                throw new AuraHandledException('Something went wrong: '+ e.getMessage());   
            }
            
        } 
        
        else{
            conList[0].FirstName=conFirst;
            conList[0].LastName=conLast;
            try{
                update conList;
                booking.Contact__c = conList[0].Id;
            }catch (Exception e) {
                throw new AuraHandledException('Something went wrong: '+ e.getMessage());   
            }
            
        }
        
        
        booking.Flight__c = flightId;
        try{
            insert booking;
            sendEmail(booking.id, conEmail);
            return booking.Id;    
        }catch (Exception e) {
            throw new AuraHandledException('Something went wrong: '+ e.getMessage());   
        }
    }
    @future (callout=true)
    public static void sendEmail(ID id, String conEmail){
        PageReference pdfAttachment = Page.FlightPDF;
        pdfAttachment.getParameters().put('id', id);
        String messageBody = '';
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.settoaddresses(new String[] {conEmail});
        mail.setSubject('[Deloitte Airlines] Flight Details');	
        mail.setHtmlBody(messageBody);
        
        Attachment attach = new Attachment();
        attach.ParentId = id;
        attach.name='FlightDetails.pdf';
        attach.body=pdfAttachment.getContent();
        insert attach;
        
        Messaging.EmailFileAttachment eAttach = new Messaging.EmailFileAttachment();
        eAttach.setFileName(attach.name);
        eAttach.setBody(attach.body);
        mail.setFileAttachments(new List<Messaging.EmailFileAttachment> {eAttach});
        
        Messaging.SendEmailResult [] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
       
    }
    /* @AuraEnabled
public static Decimal gettotalAmount(){
List<Flight__c> listAmount = [SELECT Id, Fly_Only__c FROM Flight__c];
Decimal sumAmount = 0;
for(Flight__c amt : listAmount){
sumAmount = sumAmount + amt.Fly_Only__c;
}
return sumAmount;
}*/
}