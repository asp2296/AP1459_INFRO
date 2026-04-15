param location string = resourceGroup().location

resource linuxVM 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: 'test-linux-vm'
  location: location
  properties: {
    osProfile: {
      computerName: 'hostname'
      adminUsername: 'adminuser'
      adminPassword: 'Password1234!'
      linuxConfiguration: {
        // This is the finding: password auth should be 'true' to disable it
        disablePasswordAuthentication: false 
      }
    }
    hardwareProfile: { vmSize: 'Standard_B1s' }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [{ id: 'dummy-id' }]
    }
  }
}
