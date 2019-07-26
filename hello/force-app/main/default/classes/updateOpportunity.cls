public class updateOpportunity
{	
	public static void stageNameVerification(List<Opportunity> newOpp, Map<Id,Opportunity> oldMap){
       for(Opportunity opp : newOpp){
           
               if(opp.StageName == 'Closed Won' && oldMap.get(opp.id).StageName != 'Closed Won'){
						opp.Description = 'This Opportunity is Closed Won';
						}
           
         
       }
        
    }
    
}