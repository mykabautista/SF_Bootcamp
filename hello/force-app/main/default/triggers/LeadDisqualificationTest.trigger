trigger LeadDisqualificationTest on Lead (before insert) {
	  for(Lead myLead: Trigger.new){
          String name = 'test';
        
          if(myLead.FirstName.equalsIgnoreCase(name) || myLead.LastName.equalsIgnoreCase(name)){
              myLead.status = 'Disqualified';
          }
          
          
      }
}