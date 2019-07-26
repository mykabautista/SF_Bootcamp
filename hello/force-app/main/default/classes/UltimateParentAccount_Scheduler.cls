global class UltimateParentAccount_Scheduler implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        Database.executeBatch(new UltimateParentAcct());
    }
}