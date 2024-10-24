## Service Appointment System Database: Installation and Backup

### Installation

1. **Prerequisites:** Ensure you have Microsoft Access and SQL Server Management Studio (SSMS) installed on your computer.
2. **Software Installation:** Install the software following the provided instructions.
3. **Database Download:** Download the `ServiceAppointmentSystem.bak` file.

### Prepare and Restore Database

1. **SSMS Connection:** Open SSMS and connect using your Windows login account.
2. **Create Database:** Create a new database named "ServiceAppointmentSystem" by right-clicking the Databases button.
3. **Restore Database:**
   - Select Databases > Restore Database...
   - Choose the source from Device > click ... > Add > Select `ServiceAppointmentSystem.bak` > OK > OK > Verify Backup Media.
   - If you encounter a warning about "Tail-log backups...", go to the Options page and unselect that option.
4. **Change Owner:** Once restored, change the owner:
   ```sql
   USE ServiceAppointmentSystem;
   EXEC sp_changedbowner 'yourlastnameUser', 'true';
   ```
5. **Update Login:** Navigate to Security > Logins and update the `yourlastnameUser` login to have `ServiceAppointmentSystem` as the default database.

### Open MS Access and Create a New Database

1. **Create New Database:** Click File -> New -> Blank Database. Set the name and location, then click Create.

### Link to SQL Server

1. **External Data:** Click External Data on the Ribbon.
2. **New Data Source:** Select New Data Source > From Database > From SQL Server.
3. **Link to Data Source:** Choose Link to the data source by creating a linked table > OK.
4. **Machine Data Source:** Choose Machine Data Source > New...
5. **User Data Source:** Choose User Data Source > Next > Choose SQL Server Or ODBC > Next > Finish.

### Create a New Data Source to SQL Server

1. **Input Name and Description:** Input a name and description for the Data Source.
2. **Select SQL Server:** Select the SQL Server you want to connect to.
3. **Authentication Method:** Choose "With SQL Server Authentication using a login ID and password entered by the user".
4. **Login ID and Password:** Enter your SQL Server login ID and password.

### Linked Tables

1. **Click Finish:** Click Finish to return to the Select Data Source dialog.
2. **Choose Data Source:** Choose the data source you just created.
3. **Click OK:** Click OK.
4. **Enter Password:** Enter your password in the SQL Server Login dialog box.
5. **Select Tables:** In the Link Tables dialog box, select the desired tables and click OK.

### Backup Database

1. **Right-Click Database:** Right-click on the database icon.
2. **Select Task:** Choose "Task" from the context menu.
3. **Choose Backup:** Select the "Backup" option.
4. **Click OK:** Click OK to start the backup process.

**Note:** These instructions provide a general overview. Refer to the accompanying application description or functionality for more detailed information.
