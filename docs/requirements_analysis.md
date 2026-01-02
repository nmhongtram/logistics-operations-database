# PROJECT REQUIREMENTS ANALYSIS

---

## 1. Project Overview

The Logistics Operations Data Warehouse and Analytics project aims to design and implement a centralized analytical system that transforms raw, normalized logistics operational data into actionable insights. The project leverages a multi-year synthetic logistics dataset representing a Class 8 trucking company operating between 2022 and 2024.

The primary focus of the project is **data modeling, SQL-based analytics, and business intelligence reporting**, rather than predictive modeling or advanced optimization. The system is intended to support descriptive and diagnostic analytics for logistics operations, enabling stakeholders to evaluate performance, costs, and efficiency across drivers, fleet assets, routes, customers, and time.

---

## 2. Business Problem Statement

Logistics and transportation operations generate large volumes of transactional data across multiple operational domains such as dispatching, fuel management, maintenance, and delivery execution. In a normalized operational database:

* Data is fragmented across many interrelated tables
* Cross-functional analysis (e.g., driver vs. route vs. cost) is complex and time-consuming
* Decision-makers lack a unified, historical view of operational performance
* Reporting often relies on static summaries rather than interactive analytics

This project addresses these challenges by building a **Logistics Operations Data Warehouse** optimized for analytical querying and dashboarding, enabling consistent performance measurement and data-driven operational decision-making.

---

## 3. Project Objectives

### 3.1 Primary Objectives

* Design a structured **data warehouse schema** suitable for logistics analytics
* Integrate multiple operational data sources into a unified analytical model
* Enable complex SQL queries for performance and cost analysis
* Develop interactive Power BI dashboards to visualize key logistics metrics

### 3.2 Secondary Objectives

* Demonstrate best practices in dimensional modeling and SQL analytics
* Support time-series and trend analysis over a three-year period
* Provide a reusable analytical foundation that can be extended in future versions

---

## 4. Data Sources and Scope

### 4.1 Data Coverage

* **Time Period:** January 2022 – December 2024
* **Geographic Scope:** National U.S. operations across multiple cities and facilities
* **Data Volume:**

  * 85,000+ total records
  * 14 interconnected tables
* **Data Type:**

  * Master / reference data
  * Transactional operational data
  * Pre-aggregated monthly performance metrics

### 4.2 Source Tables Overview

**Master and Reference Data**

* Drivers: employment details, experience, licensing, home terminal
* Trucks: fleet specifications, acquisition details, fuel capacity, status
* Trailers: equipment type, size, status, and location
* Customers: account details, contract terms, payment terms
* Facilities: terminals and warehouses with geographic attributes
* Routes: origin-destination lanes, distance, rates, transit expectations

**Operational Transaction Data**

* Loads: shipment bookings, revenue components, and status
* Trips: execution-level data linking drivers, trucks, and trailers
* Fuel Purchases: transaction-level fuel consumption and cost data
* Maintenance Records: service events, costs, and downtime
* Delivery Events: pickup and delivery timestamps and service quality indicators
* Safety Incidents: accidents, violations, and safety-related costs

**Aggregated Metrics**

* Driver Monthly Metrics
* Truck Utilization Metrics

---

## 5. Data Relationships

The analytical model must preserve and leverage the following key relationships:

* Loads are associated with a single customer and a single route
* Each load corresponds to one executed trip
* Trips link drivers, trucks, and trailers
* Fuel purchases, delivery events, and safety incidents are tied to trips
* Maintenance records are associated with trucks
* Monthly performance tables summarize driver- and truck-level activity

These relationships form the foundation for dimensional modeling and multi-table analytical queries.

---

## 6. Functional Requirements

### 6.1 Data Warehouse Design

The system shall implement a dimensional data model that supports analytical workloads, including:

* **Fact tables** capturing measurable operational events (e.g., trips, loads, fuel, maintenance, deliveries)
* **Dimension tables** describing drivers, trucks, trailers, customers, routes, facilities, and time
* Historical tracking to enable trend and seasonality analysis

The design should support efficient aggregation by time, asset, personnel, and geography.

---

### 6.2 Analytical Capabilities

The data warehouse must support analysis across the following domains:

#### Driver Performance Analysis

* On-time delivery rates
* Revenue and miles per driver
* Fuel efficiency (MPG)
* Monthly productivity trends

#### Route and Lane Analysis

* Revenue and cost comparison by route
* Fuel and maintenance cost impact by lane
* Reliability and transit performance

#### Fleet Utilization Analysis

* Miles and trips per truck
* Revenue per asset
* Utilization and downtime patterns

#### Maintenance and Reliability Analysis

* Maintenance cost per mile
* Downtime impact on utilization
* Relationship between equipment age and maintenance frequency

#### Fuel Efficiency Analysis

* MPG trends over time
* Fuel cost distribution by route and truck
* Impact of fuel price fluctuations

#### Customer Analysis

* Revenue contribution by customer
* Service performance levels
* Customer concentration risk

#### Safety Analysis

* Incident frequency and severity
* Preventable vs. non-preventable incidents
* Safety trends by driver experience

#### Seasonal and Temporal Analysis

* Load volume and revenue seasonality
* Rate and utilization fluctuations across months and years

---

### 6.3 SQL Requirements

The project shall demonstrate advanced SQL capabilities, including:

* Multi-table JOINs across operational and dimension tables
* Use of Common Table Expressions (CTEs)
* Window functions for ranking, rolling metrics, and comparisons
* Time-based aggregations (monthly, quarterly, yearly)
* Data validation and handling of missing values

---

### 6.4 Power BI Requirements

The Power BI layer shall provide:

* Interactive dashboards with filters and slicers
* Drill-down and drill-through capabilities
* KPI visualizations and trend analysis
* Clear separation between executive-level overviews and operational detail views

---

## 7. Non-Functional Requirements

* **Performance:** Queries and dashboards should return results efficiently
* **Scalability:** The data model should support future data expansion
* **Data Quality:** Referential integrity must be maintained
* **Reproducibility:** All transformations and calculations must be documented and repeatable

---

## 8. Constraints and Assumptions

### 8.1 Constraints

* The dataset does not include HOS compliance, weather impact, ELD data, or detailed payment histories
* Route planning does not account for traffic or construction conditions

### 8.2 Assumptions

* The dataset accurately reflects realistic trucking industry patterns
* Financial and operational metrics are internally consistent
* Analysis is focused on operational and managerial decision support

---

## 9. Expected Deliverables

* Data warehouse schema (logical and physical design)
* SQL scripts for data transformation and analytics
* Power BI dashboards for logistics performance analysis
* Project documentation and metric definitions

---

## 10. Success Criteria

The project will be considered successful if:

* The data warehouse supports complex, multi-dimensional logistics analysis
* SQL queries demonstrate analytical depth and correctness
* Power BI dashboards clearly communicate operational insights
