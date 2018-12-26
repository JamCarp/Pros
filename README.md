#Home Advisor Pros iOS Application supporting iPhone.

Key Features:
--  Launch Screenshot.
--  Pros List screen.
--  Application reads and parses the local JSON in the background to fetch the list of Pros.
--  Once Application gets the successful parses the offers, the app will HAPro model classes using codable.
--  Application will display the list of Pros in a UITableView.
--  Pros cell will display Pro's Name and Ratings | Composite Rating in different colors as per the criteria.
--  After selecting one of the Pros, the app will navigate to the Pro details screen.
        -- In The Pro details screen, the app will display more information like the specialty, location, services offered, company overview along with information from List Screen.
        --  Offer details Screen has a Call and Email buttons which will print the phone number and email respectively

Technical Details:
- The application currently doesn't use any third party libraries or adding any dependencies using Carthage or Cocoapods.
- The application is implemented in VIPER architecture.
- The application has two main components or modules:
      - Pros List.
      - Pro Details.


Code Structure:
-- Contract   - Defines the contract between all the VIPER components including View, Presenter, Interactor and Router. The contract also defines the communication between different modules if necessary.
-- View       - ViewController - Implements the TableView and via extensions implements other multiple protocols. Handles the primary responsibilities for displaying the cell with Pros.
-- Presenter  - Handles the primary business logic needed by Views.
-- Interactor - Performs key business logic. Including talking to Service layers, Data Layers.
-- Router     - Performs key routing logic between multiple components and also constructing its own module.
-- Entity     - Contains the Pro Information.

Unit Test Coverage:
-- Current App has unit test coverage on most of the source files including View, Presenter, Interactor, Router, Entity.

UI Test Coverage:
 -- Current App has only one UI test case to verify the provider details screen layout and information. It will check to details screen to see if all the UI elements exist and also checks to make pro details screen is displaying the selected pro from the pro list screen.
