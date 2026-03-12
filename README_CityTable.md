# City Table & City Linking Script

This SQL script extends the existing banking database by adding a **City dimension** and linking it to existing tables. It enables city-level analysis for employees, customers, and branch/ATM locations.

---

## **Purpose**

- Create the `City` table to store city information including:
  - Name
  - Region
  - Population
  - East/West indicator
- Link `Customer`, `Employee`, and `Location` tables to `City` via `CityID`.
- Populate city data based on existing customer and location data.
- Enable city-level aggregation and reporting.

---

## **Tables Created/Modified**

1. **`City`**
   - Stores city information.
   - Columns: `ID` (PK), `Name`, `Region`, `Population`, `EastWest`.

2. **Modified Tables**
   - `Customer` → Added `CityID` foreign key to reference `City`.
   - `Location` → Added `CityID` foreign key to reference `City`.
   - `Employee` → Added `CityID` foreign key to reference `City`.

---

## **Operations in the Script**

1. **Insert Cities**
   - Extract city names from `Customer` and `Location` tables.
   - Remove prefixes like `"ATM "` or `"branch office"` to standardize city names.
   - Update known cities with population, region, and East/West information.

2. **Link Tables**
   - Assign `CityID` to customers, employees, and locations.
   - Ensures all entities are connected to a city for analytics.

3. **City-Level Analysis**
   - Allows queries like:
     - Total transactions per city
     - Minimum and maximum transactions per city
     - Aggregated account balances per city
     - Top or bottom transactions per location/city

---

## **Example Queries**

-- Get total account balance per city
SELECT c.Name AS City, SUM(ad.Amount) AS TotalBalance
FROM AccountDetails ad
JOIN Location l ON ad.LocationId = l.Id
JOIN City c ON l.CityID = c.ID
GROUP BY c.Name
ORDER BY TotalBalance DESC;
