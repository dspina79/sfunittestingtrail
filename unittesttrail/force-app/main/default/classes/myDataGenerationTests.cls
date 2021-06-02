@istest
public with sharing class myDataGenerationTests {
    @TestSetup
    static void makeData(){
        Test.loadData(Account.SObjectType, 'Mock_Data');
    }

    @istest 
    static void testForAccountLoading() {
        List<Account> accts = [SELECT Id FROM Account];
        System.assertEquals(15, accts.size(), 'There should have been 15 accounts.');
    }
}