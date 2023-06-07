
@description('Generated from /subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/resourceGroups/sb-streaming-demo/providers/Microsoft.Web/connections/eventhubs-3')
resource eventhubs 'Microsoft.Web/connections@2016-06-01' = {
  kind: 'V1'
  properties: {
    displayName: 'NYSEStockAPI'
    authenticatedUser: {}
    overallStatus: 'Connected'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    connectionState: 'Enabled'
    parameterValueSet: {
      name: 'connectionstringauth'
      values: {}
    }
    customParameterValues: {}
    createdTime: '2023-06-02T01:12:44.2673272Z'
    changedTime: '2023-06-02T01:12:44.2673272Z'
    api: {
      name: 'eventhubs'
      displayName: 'Event Hubs'
      description: 'Connect to Azure Event Hubs to send and receive events.'
      iconUri: 'https://connectoricons-prod.azureedge.net/u/v-amism/eventhubs/mi-fix/1.0.1628.3244/eventhubs/icon.png'
      brandColor: '#c4d5ff'
      category: 'Standard'
      id: '/subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/providers/Microsoft.Web/locations/australiaeast/managedApis/eventhubs'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
    testRequests: []
  }
  name: 'eventhubs-3'
  location: 'australiaeast'
}
