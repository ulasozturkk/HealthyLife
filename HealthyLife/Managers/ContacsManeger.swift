import Contacts
import Foundation

class ContacsManeger {
  static let shared = ContacsManeger()
  private init() {}
  
  func requestPermission() {
    let store = CNContactStore()
    
    store.requestAccess(for: .contacts) { granted, _ in
      if granted {}
    }
  }
  
  func getContacs(completion: @escaping ([People])-> ()) {
    let store = CNContactStore()
    var contacs: [People] = []
    
    // keys
    let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
    // fetch request
    let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
    
    do {
      try store.enumerateContacts(with: fetchRequest) { contact, _ in
        // do something contacs
        for number in contact.phoneNumbers {
          contacs.append(People(name: contact.givenName, phoneNumber: number.value.stringValue))
        }
      }
      completion(contacs)
    } catch {}
  }
}
