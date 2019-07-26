({
	donationButton : function(component, event, helper) {
        var validExpense = component.find('donationform').reduce(function (validSoFar, inputCmp) {
             inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
         if(validExpense){
                 var newDonation = component.get("v.newDonation");
                console.log(newDonation);//gets inputted data
                    var action = component.get("c.saveDonation");
              
                        action.setParams({
                            newDonation : newDonation
                        }); 
                        action.setCallback(this,function(a){
                            //get the response state
                            var state = a.getState();
                           
                            //check if result is successfull
                            if(state == "SUCCESS"){
                                //Reset Form
                                var dons = {'sobjectType': 'Donation__c',
                                                    'Name': '',
                                                    'Amount__c': '',
                                                    'Donation_Date__c': '',
                                                    'Note__c': '' 
                                                   };
                                //resetting the Values in the form
                                component.set("v.newDonation",dons);
                                  $A.get('e.force:refreshView').fire();
                            } else if(state == "ERROR"){
                                alert('Error in calling server side action');
                                 
                            }
                        }); 
                    $A.enqueueAction(action);  
                    console.log("Create donation: " + JSON.stringify(dons));
                    //helper.displayInfo(component, newDonation);
	}
    }
    
})