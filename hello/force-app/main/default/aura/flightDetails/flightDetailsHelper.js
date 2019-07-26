({
    fetchFuncHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Flight Number', fieldName: 'Flight_Number__c', type: 'text'},
            {label: 'Depart/Arrive', fieldName: 'Join_Flights__c', type: 'formula'},
            { 
                label: 'Departure Time', 
                fieldName: 'Departure_Time__c', 
                type: 'date', 
                typeAttributes: {
                    hour: '2-digit',
                    minute: '2-digit',
                    hour12: true
                },
                sortable: false
            },
            { 
                label: 'Arrival Time', 
                fieldName: 'Arrival_Time__c', 
                type: 'date', 
                typeAttributes: {
                    hour: '2-digit',
                    minute: '2-digit',
                    hour12: true
                },
                sortable: false
            },
             {label: 'Fly Only', fieldName: 'Fly_Only__c', type: 'number'},
            {label: 'Available Seats', fieldName: 'Available_Seats__c', type: 'number'}
            
            
        ]);
    },
    getFlightsHelper : function(component,event,helper){
        var flyFrom = event.getParam("from");
        var flyTo = event.getParam("to");
        var dDate = event.getParam("Depdate");
        var action = component.get("c.fetchFlight"); //from apex controller
        action.setParams({flyFrom:flyFrom,
                          flyTo:flyTo,
                          dDate:dDate                          
                         });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.flightList", response.getReturnValue());
                if(response.getReturnValue() == ""){
                    component.set("v.norecords", "No records found.");
                   
                } else if(response.getReturnValue() != ""){
                    component.set("v.norecords", '');
                   
                }
            }
        });
        $A.enqueueAction(action);
    }
})