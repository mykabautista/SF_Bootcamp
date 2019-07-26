({
    flightFunc : function(component, event, helper) {
        helper.fetchFuncHelper(component, event, helper);
    },
    getFlights : function(component, event, helper) {
        helper.getFlightsHelper(component, event, helper);
    },
    handleSelect : function(component, event, helper) {
        let button = component.find('disablebuttonid');
        button.set('v.disabled',false);
        var selectedRows = event.getParam('selectedRows'); 
        var records = selectedRows[0];
        component.set("v.selectedAccts", records);
        console.log(records.Id);
        
    },
    openModel: function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        component.set("v.isOpen", true);
    },
    
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    },
    finalBooking: function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        var action = component.get("c.contactDetails");  
        action.setParams ({
            "conFirst" : component.get("v.newContact.FirstName"),
            "conLast" : component.get("v.newContact.LastName"),
            "conEmail" : component.get("v.newContact.Email"),
            "flightId" : component.get("v.selectedAccts.Id"),
        });
        
        //apex controller
        action.setCallback(this, function(a) {
            console.log("hello");
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log("bye");
                var name = a.getReturnValue();
                console.log("hello"+name);
                var urlEvent = $A.get("e.force:navigateToSObject");
                urlEvent.setParams({
                    "recordId": name,
                    "slideDevName": "Detail"
                });
                urlEvent.fire();
                
            }else if (state === "ERROR" || fname == null || lName == null || eMail == null) {
                
                toastEvent.setParams({
                    "title": "Error:",
                    "type": "error",
                    "message": "Incomplete values."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action)
    }/*,  
    doInit : function(component, event, helper) {
		var action = component.get("c.gettotalAmount"); //method from class
        
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS'){
                component.set('v.totalAmount', response.getReturnValue());
            } else{
            
            }                   
        });
        $A.enqueueAction(action); 
	}*/
})