# Banking Employee & Salary Database

This repository contains SQL scripts to create and populate a **banking employee and salary database** for demonstration, testing, and analytics purposes. The database tracks employees, their departments, locations, seniority levels, and detailed salary information, including bonuses, overtime, and leave data.

---

## **Database Structure**

### **Tables**

1. **`SeniorityLevel`**
   - Stores employee seniority levels (e.g., Junior, Senior, Manager, CEO).
   - Columns: `ID` (PK, auto-increment), `Name`.

2. **`Location`**
   - Stores geographical information of employees.
   - Columns: `ID` (PK), `CountryName`, `Continent`, `Region`.

3. **`Department`**
   - Stores department names within the bank.
   - Columns: `ID` (PK), `Name`.

4. **`Employee`**
   - Stores employee personal information and links to department, location, and seniority level.
   - Columns: `ID` (PK), `FirstName`, `LastName`, `LocationID`, `SeniorityLevelID`, `DepartmentID`.

5. **`Salary`**
   - Stores detailed salary and leave information for employees.
   - Columns:
     - `ID` (PK)
     - `EmployeeID`
     - `Month`, `Year`
     - `GrossAmount`, `NetAmount`, `RegularWorkAmount`, `BonusAmount`, `OvertimeAmount`
     - `VacationDays`, `SickLeaveDays`

6. **Temporary Tables**
   - `#DATA` → Stores month numbers (1–12) for populating salary data.  
   - `#DATA2` → Stores years (2001–2020) for populating salary data.

---

## **Data Population**

- **Seniority levels** and **departments** are inserted using `INSERT INTO` statements.  
- **Employee records** are populated from a sample dataset (`WideWorldImporters.Application.People`) and linked to departments, locations, and seniority levels.  
- **Salary records** are generated for each employee for all combinations of month and year using CROSS JOIN with temporary tables.  
- Salary fields (`GrossAmount`, `NetAmount`, `RegularWorkAmount`, `BonusAmount`, `OvertimeAmount`) are calculated or randomized to simulate real-world data.  
- Leave fields (`VacationDays`, `SickLeaveDays`) are also populated using conditional logic and modulo calculations to vary values across employees and months.

---

## **Example Queries**

- Select employees with salary discrepancies:

```sql
SELECT *
FROM Salary
WHERE NetAmount <> (RegularWorkAmount + BonusAmount + OvertimeAmount);
