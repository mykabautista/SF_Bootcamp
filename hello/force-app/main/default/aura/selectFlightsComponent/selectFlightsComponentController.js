({
    flightsButton: function(component, event) {
        var toastEvent = $A.get("e.force:showToast");
        var dDate = component.find("dDate").get("v.value"); //aura id from component
        var origin  = component.find("flightFrom").get("v.value");
        var destination = component.find("flightTo").get("v.value");
        var searchEvent = $A.get("e.c:flightEvent");
        
        searchEvent.setParams({
            "from": origin, //attributes from event
            "to": destination,
            "Depdate": dDate
        });
        searchEvent.fire();
        
        if(dDate == "" || origin == "" || destination == ""){
            toastEvent.setParams({
                "title": "Error:",
                "type": "error",
                "message": "Incomplete values."
            });
            toastEvent.fire();
        }
        
    }
})