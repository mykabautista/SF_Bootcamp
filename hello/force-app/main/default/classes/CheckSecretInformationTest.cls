@isTest
private class CheckSecretInformationTest {

    @isTest static void createCaseWithSecretInfo(){
        //Create a case with all the required inputs
        //Requirements:
        //1.Create or update a case
        //2.Case subject cannot begin with Warning
        //3.Case description can't be null
        //4. Case description contains a secret keyword
        //
        Case myCase 	   = new Case();
        myCase.Subject     = 'HELP!!!';
        myCase.Description = 'My bodyweight is 180 pounds.';
        insert myCase;
        
        System.debug('Case ' + myCase.Id + ' created with description ' + myCase.Description);
    }
}