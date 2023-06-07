
@description('Generated from /subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/resourceGroups/sb-streaming-demo/providers/Microsoft.Logic/workflows/sb-stream-nyse-demo')
resource sbstreamnysedemo 'Microsoft.Logic/workflows@2019-05-01' = {
  properties: {
    state: 'Disabled'
    integrationAccount: {
      id: '/subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/resourceGroups/sb-streaming-demo/providers/Microsoft.Logic/integrationAccounts/sb-stream-nyse-demo-int'
    }
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
      }
      triggers: {
        Recurrence: {
          recurrence: {
            frequency: 'Second'
            interval: 1
          }
          evaluatedRecurrence: {
            frequency: 'Second'
            interval: 1
          }
          type: 'Recurrence'
        }
      }
      actions: {
        Initialize_Config_Settings: {
          runAfter: {}
          type: 'Compose'
          inputs: {
            numberOfMessages: 10
            priceRangeMax: 100
            priceRangeMin: 70
            quantityRangeMax: 300
            quantityRangeMin: 100
            stockTickers: [
              'MSFT'
              'AMZN'
              'GOOGL'
              'FB'
              'TWTR'
            ]
          }
        }
        Initialize_messageCount: {
          runAfter: {
            Initialize_Config_Settings: [
              'Succeeded'
            ]
          }
          type: 'InitializeVariable'
          inputs: {
            variables: [
              {
                name: 'messageCount'
                type: 'integer'
                value: 1
              }
            ]
          }
        }
        Parse_Config_Settings: {
          runAfter: {
            Initialize_messageCount: [
              'Succeeded'
            ]
          }
          type: 'ParseJson'
          inputs: {
            content: '@outputs(\'Initialize_Config_Settings\')'
            schema: {
              properties: {
                numberOfMessages: {
                  type: 'integer'
                }
                priceRangeMax: {
                  type: 'integer'
                }
                priceRangeMin: {
                  type: 'integer'
                }
                quantityRangeMax: {
                  type: 'integer'
                }
                quantityRangeMin: {
                  type: 'integer'
                }
                stockTickers: {
                  items: {
                    type: 'string'
                  }
                  type: 'array'
                }
              }
              type: 'object'
            }
          }
        }
        Until_numberOfMessages_is_achieved: {
          actions: {
            Capture_Stock_Trade_Message: {
              runAfter: {
                Generate_Stock_Trade_Message: [
                  'Succeeded'
                ]
              }
              type: 'Compose'
              inputs: '@outputs(\'Generate_Stock_Trade_Message\')?[\'body\']'
            }
            Generate_Stock_Trade_Message: {
              runAfter: {}
              type: 'JavaScriptCode'
              inputs: {
                code: 'var configSettings = workflowContext.actions.Initialize_Config_Settings.outputs;\r\nstockTickerIndex = Math.round(Math.random() * 100) % configSettings.stockTickers.length;\r\nvar stockTrade = {\r\n    StockTicker: configSettings.stockTickers[stockTickerIndex],\r\n    Quantity: Math.round(configSettings.quantityRangeMin + (configSettings.quantityRangeMax - configSettings.quantityRangeMin) * Math.random()), Price: configSettings.priceRangeMin + (configSettings.priceRangeMax - configSettings.priceRangeMin) * Math.random(), TradeTimestamp: new Date().toJSON()\r\n}; return stockTrade;'
              }
            }
            Increment_messageCount: {
              runAfter: {
                Send_event_to_NYSEStockTrade_Sim_Event_Hub: [
                  'Succeeded'
                ]
              }
              type: 'IncrementVariable'
              inputs: {
                name: 'messageCount'
                value: 1
              }
            }
            Send_event_to_NYSEStockTrade_Sim_Event_Hub: {
              runAfter: {
                Capture_Stock_Trade_Message: [
                  'Succeeded'
                ]
              }
              type: 'ApiConnection'
              inputs: {
                body: {
                  ContentData: '@{base64(outputs(\'Capture_Stock_Trade_Message\'))}'
                }
                host: {
                  connection: {
                    name: '@parameters(\'$connections\')[\'eventhubs_1\'][\'connectionId\']'
                  }
                }
                method: 'post'
                path: '/@{encodeURIComponent(\'nyestocktrades\')}/events'
              }
            }
          }
          runAfter: {
            Parse_Config_Settings: [
              'Succeeded'
            ]
          }
          expression: '@greater(variables(\'messageCount\'), rand(1, body(\'Parse_Config_Settings\')?[\'numberOfMessages\']))'
          limit: {
            count: 60
            timeout: 'PT1H'
          }
          type: 'Until'
        }
      }
      outputs: {}
    }
    parameters: {
      '$connections': {
        value: {
          eventhubs_1: {
            connectionId: '/subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/resourceGroups/sb-streaming-demo/providers/Microsoft.Web/connections/eventhubs-3'
            connectionName: 'eventhubs-3'
            id: '/subscriptions/d139a253-0fbd-4288-887c-c10d408c019d/providers/Microsoft.Web/locations/australiaeast/managedApis/eventhubs'
          }
        }
      }
    }
    accessControl: {}
    endpointsConfiguration: {
      workflow: {
        outgoingIpAddresses: [
          {
            address: '13.75.149.4'
          }
          {
            address: '104.210.91.55'
          }
          {
            address: '104.210.90.241'
          }
          {
            address: '52.187.227.245'
          }
          {
            address: '52.187.226.96'
          }
          {
            address: '52.187.231.184'
          }
          {
            address: '52.187.229.130'
          }
          {
            address: '52.187.226.139'
          }
          {
            address: '20.53.93.188'
          }
          {
            address: '20.53.72.170'
          }
          {
            address: '20.53.107.208'
          }
          {
            address: '20.53.106.182'
          }
        ]
        accessEndpointIpAddresses: [
          {
            address: '13.75.153.66'
          }
          {
            address: '104.210.89.222'
          }
          {
            address: '104.210.89.244'
          }
          {
            address: '52.187.231.161'
          }
          {
            address: '20.53.94.103'
          }
          {
            address: '20.53.107.215'
          }
        ]
      }
      connector: {
        outgoingIpAddresses: [
          {
            address: '52.237.214.72'
          }
          {
            address: '13.72.243.10'
          }
          {
            address: '13.70.72.192/28'
          }
          {
            address: '13.70.78.224/27'
          }
          {
            address: '20.70.220.224/28'
          }
          {
            address: '20.70.220.192/27'
          }
          {
            address: '20.213.202.84'
          }
          {
            address: '20.213.202.51'
          }
        ]
      }
    }
  }
  name: 'sb-stream-nyse-demo'
  location: 'australiaeast'
}
