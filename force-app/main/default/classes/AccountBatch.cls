public class AccountBatch implements Database.Batchable<SObject>, Schedulable {
    private Integer batchSize = 200;
    
    private AccountBatch()
    {

    }

    private AccountBatch(Integer batchSize)
    {
        this.batchSize = batchSize;
    }

    // Start schedule implementation
    public static Id scheduleBatch(String jobName, String cronExp, Integer batchSize)
    {
        return System.schedule(jobName, cronExp, new AccountBatch(batchSize));
    }
    
    public void execute(SchedulableContext SC) {
        executeBatch(this.batchSize);
    }
    // End schedule implementation
    
    // Start batch implementation
    public static Id executeBatch(Integer batchSize)
    {
        return Database.executeBatch(new AccountBatch(), batchSize);
    }

    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([
            SELECT Id, Active__c
            FROM Account
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Account> accounts)
    {
        for(Account account : accounts)
        {
            account.Active__c = account.Active__c == 'Yes' ? 'No' : 'Yes';
        }

        update accounts;
    }

    public void finish(Database.BatchableContext bc)
    {
        System.debug('Finished processing.');
    }
    // End batch implementation
}