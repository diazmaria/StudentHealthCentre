# Student Health Centre Booking System
![Image](http://i1030.photobucket.com/albums/y369/MariaPhotoB/logo_zpsrtd6m0rh.png)

### Description
This web based system has been designed to manage the **GP appoitment bookings** of an Student Health Centre.
Through this prototype users can **check the appointment availability**, **book an appointment** for their corresponding GP, **cancel an appointment** and **consult pendant appointments**.
The web system has an **administration interface** to manage bookings, GPs and patients. The administration interface will be shortly improved, in order to avoid foreign keys and replace them by their values.

### Technology
- **C#**
- **ASP.NET Framework**, I utilized **LINQ to SQL**, **ASP.NET AJAX** and **Forms Authentication** security
- **jQuery**
- HTML, CSS, Bootstrap, SQL, MySQL and Microsoft SQL Server

### License
This project is licensed under the [Apache 2 License](http://www.apache.org/licenses/LICENSE-2.0). 


### Run the Web App using Visual Studio
You must have installed and configured Visual Studio, Microsoft SQL Server and Microsoft SQL Server Management Studio Express.

1. Clone the repository or download the zip file and extract it.
2. Open Microsoft SQL Server Management Studio, create a new server and a new database that you should call StudentHealthCenter.
3. Import the .sql file attached in the project into the database.
4. Open the project into Visual Studio and iin the file Web.config replace ConnectionString: Data Source=MARIA-PC\SQLEXPRESS by your server name.
6. Once the files have been debuggued press start.

### Demo
![demo](http://i1030.photobucket.com/albums/y369/MariaPhotoB/StudentHealthCentre_zpsvwww49eb.gif)

