
@description('Generated from /subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/resourceGroups/sb-streaming-demo/providers/Microsoft.StreamAnalytics/streamingjobs/sb-stocksdemo-sta')
resource sbstocksdemosta 'Microsoft.StreamAnalytics/streamingjobs@2021-10-01-preview' = {
  name: 'sb-stocksdemo-sta'
  location: 'Australia East'
  tags: {
    'hidden-link:/Microsoft.StreamAnalytics/streamingjobs/settings': '{"createdFrom":"Portal"}'
  }
  properties: {
    sku: {
      name: 'Standard'
    }
    outputStartMode: 'JobStartTime'
    outputStartTime: '2023-06-02T01:13:37.77Z'
    eventsOutOfOrderPolicy: 'Adjust'
    outputErrorPolicy: 'Stop'
    eventsOutOfOrderMaxDelayInSeconds: 0
    eventsLateArrivalMaxDelayInSeconds: 5
    dataLocale: 'en-US'
    compatibilityLevel: '1.2'
    contentStoragePolicy: 'SystemAccount'
    jobType: 'Cloud'
    requestedRuntimeMode: 'Active'
    runtimeMode: 'Active'
    schemaRegistrySources: []
  }
  sku: {
    name: 'Standard'
    capacity: 3
  }
  identity: {
    type: 'SystemAssigned'
  }
}
