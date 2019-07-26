@isTest
public class AcctSearch_Test {
    public static testMethod void TestScenarios(){
      AcctSearch scenarioOne = TestDataFactory_AcctSearch.searchAcc('','','','');
      scenarioOne.submitForm();
        
      AcctSearch scenarioTwo = TestDataFactory_AcctSearch.searchAcc('a*','','','');
      scenarioTwo.submitForm();
        
      AcctSearch scenarioThree = TestDataFactory_AcctSearch.searchAcc('','PH','','');
       scenarioThree.submitForm();
    }


   
}