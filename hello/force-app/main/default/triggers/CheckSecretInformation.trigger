trigger CheckSecretInformation on Case (after insert, before update) {
    /*
    String childCaseSubject = 'Warning: Parent case may contain secret info';
     
    //create a collection containing each of our secret keywords
    Set<String>	secretKeywords = new Set<String>();
    secretKeywords.add('Credit Card');
    secretKeywords.add('Social Security');
    secretKeywords.add('SSN');
    secretKeywords.add('Passport');
    secretKeywords.add('Bodyweight'); 
    
    //check to see if our case contains any of the secret keywords
    List<Case> casesWithSecretInfo = new List<Case>();
    set<String> code = new set<String>();
    for (Case myCase : Trigger.new){
        if (myCase.Subject != childCaseSubject){
        for (String keyword : secretKeywords){
            if (myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)){
                casesWithSecretInfo.add(myCase);
                System.debug('Case ' + myCase.Id + ' include secret keyword ' + keyword);
                 code.add(keyword);
      
            }
        }
    }
    }
      
    //if our case contains a secret keyword, create a child case
    for (Case caseWithSecretInfo : casesWithSecretInfo){
        Case childCase = new Case();
        childCase.subject = childCaseSubject;
        childCase.ParentId = caseWithSecretInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority = 'High';
        childCase.Description = 'Secret keyword/s found: ' + code;
        insert childCase;
    }
*/
}