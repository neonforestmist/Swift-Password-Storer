import Foundation

class PasswordManager {
    private var passwords: [String] = []
    var alertMessage: String = "Enter a command: 'Store' to store a password, 'Show' to display all passwords, or 'Exit' to quit."
    
    func runCommand(_ command: String) {
        switch command {
        case "Store":
            // Call store password procedure
            storePasswordProcedure()
        case "Show":
            // Display passwords
            displayPasswords()
        case "Exit":
            // Exiting
            exit(0)
        default:
            // Unknown command
            alertMessage = "Unknown command. Try again."
        }
    }
    
    private func storePasswordProcedure() {
        // Type password alert
        alertMessage = "Type the password you want to store:"
        print(alertMessage)
        if let newPassword = readLine() {
            storePassword(newPassword)
        }
    }
    
    func storePassword(_ newPassword: String) {
        passwords.append(newPassword)
        alertMessage = "Password stored successfully."
        print(alertMessage)
    }
    
    func displayPasswords() {
        if passwords.isEmpty {
            print("No passwords stored.")
        } else {
            print("Stored Passwords:")
            for password in passwords {
                print(password)
            }
        }
    }
    
    func getPasswords() -> [String] {
        return passwords
    }
}

// The main program
let manager = PasswordManager()
print(manager.alertMessage)

while true {
    if let command = readLine() {
        manager.runCommand(command)
    }
}
