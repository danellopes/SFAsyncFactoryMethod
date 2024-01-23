Id batchJobId = AccountBatch.executeBatch(200);
Id scheduleJobId = AccountBatch.scheduleBatch('Test Batch Job 1', '0 0 0 3 9 ? 2042', 200);

System.debug(String.format('\nBatchJobId: {0}\nScheduleJobId: {1}', new List<Object>{batchJobId, scheduleJobId}));