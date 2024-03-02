\ Model Scenatio_[1, 2, 3]
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  10 y[1] + 13 y[2] + 14 y[3] + 10 y[4] + 5 y[5] + 5 y[6] + 2 w[1] + 8 w[2]
   + 7 w[3] + 10 w[4] + 3 w[5] + 5 w[6] + 6 x[1,1,1] + 8 x[1,1,2]
   + 9 x[1,1,3] + 10 x[1,2,1] + 13.33333333333333 x[1,2,2] + 15 x[1,2,3]
   + 8 x[1,3,1] + 10.66666666666667 x[1,3,2] + 12 x[1,3,3] + 10 x[1,4,1]
   + 13.33333333333333 x[1,4,2] + 15 x[1,4,3] + 6 x[1,5,1] + 8 x[1,5,2]
   + 9 x[1,5,3] + 10 x[1,6,1] + 13.33333333333333 x[1,6,2] + 15 x[1,6,3]
   + 7 x[2,1,1] + 9 x[2,1,2] + 5 x[2,1,3] + 11.66666666666667 x[2,2,1]
   + 15 x[2,2,2] + 8.333333333333332 x[2,2,3] + 4.666666666666666 x[2,3,1]
   + 6 x[2,3,2] + 3.333333333333333 x[2,3,3] + 4.666666666666666 x[2,4,1]
   + 6 x[2,4,2] + 3.333333333333333 x[2,4,3] + 2.333333333333333 x[2,5,1]
   + 3 x[2,5,2] + 1.666666666666667 x[2,5,3] + 4.666666666666666 x[2,6,1]
   + 6 x[2,6,2] + 3.333333333333333 x[2,6,3] + 6.666666666666666 x[3,1,1]
   + 5.333333333333333 x[3,1,2] + 4 x[3,1,3] + 6.666666666666666 x[3,2,1]
   + 5.333333333333333 x[3,2,2] + 4 x[3,2,3] + 6.666666666666666 x[3,3,1]
   + 5.333333333333333 x[3,3,2] + 4 x[3,3,3] + 3.333333333333333 x[3,4,1]
   + 2.666666666666667 x[3,4,2] + 2 x[3,4,3] + 16.66666666666666 x[3,5,1]
   + 13.33333333333333 x[3,5,2] + 10 x[3,5,3] + 6.666666666666666 x[3,6,1]
   + 5.333333333333333 x[3,6,2] + 4 x[3,6,3] + 2.333333333333333 x[4,1,1]
   + 1.666666666666667 x[4,1,2] + 3 x[4,1,3] + 2.333333333333333 x[4,2,1]
   + 1.666666666666667 x[4,2,2] + 3 x[4,2,3] + 9.333333333333332 x[4,3,1]
   + 6.666666666666666 x[4,3,2] + 12 x[4,3,3] + 7 x[4,4,1] + 5 x[4,4,2]
   + 9 x[4,4,3] + 4.666666666666666 x[4,5,1] + 3.333333333333333 x[4,5,2]
   + 6 x[4,5,3] + 2.333333333333333 x[4,6,1] + 1.666666666666667 x[4,6,2]
   + 3 x[4,6,3] + 8 x[5,1,1] + 9.333333333333332 x[5,1,2]
   + 9.333333333333332 x[5,1,3] + 4 x[5,2,1] + 4.666666666666666 x[5,2,2]
   + 4.666666666666666 x[5,2,3] + 4 x[5,3,1] + 4.666666666666666 x[5,3,2]
   + 4.666666666666666 x[5,3,3] + 8 x[5,4,1] + 9.333333333333332 x[5,4,2]
   + 9.333333333333332 x[5,4,3] + 10 x[5,5,1] + 11.66666666666667 x[5,5,2]
   + 11.66666666666667 x[5,5,3] + 2 x[5,6,1] + 2.333333333333333 x[5,6,2]
   + 2.333333333333333 x[5,6,3]
Subject To
 assign_to_open_facility[1,1,1]: - y[1] + x[1,1,1] <= 0
 assign_to_open_facility[1,1,2]: - y[1] + x[1,1,2] <= 0
 assign_to_open_facility[1,1,3]: - y[1] + x[1,1,3] <= 0
 assign_to_open_facility[1,2,1]: - y[2] + x[1,2,1] <= 0
 assign_to_open_facility[1,2,2]: - y[2] + x[1,2,2] <= 0
 assign_to_open_facility[1,2,3]: - y[2] + x[1,2,3] <= 0
 assign_to_open_facility[1,3,1]: - y[3] + x[1,3,1] <= 0
 assign_to_open_facility[1,3,2]: - y[3] + x[1,3,2] <= 0
 assign_to_open_facility[1,3,3]: - y[3] + x[1,3,3] <= 0
 assign_to_open_facility[1,4,1]: - y[4] + x[1,4,1] <= 0
 assign_to_open_facility[1,4,2]: - y[4] + x[1,4,2] <= 0
 assign_to_open_facility[1,4,3]: - y[4] + x[1,4,3] <= 0
 assign_to_open_facility[1,5,1]: - y[5] + x[1,5,1] <= 0
 assign_to_open_facility[1,5,2]: - y[5] + x[1,5,2] <= 0
 assign_to_open_facility[1,5,3]: - y[5] + x[1,5,3] <= 0
 assign_to_open_facility[1,6,1]: - y[6] + x[1,6,1] <= 0
 assign_to_open_facility[1,6,2]: - y[6] + x[1,6,2] <= 0
 assign_to_open_facility[1,6,3]: - y[6] + x[1,6,3] <= 0
 assign_to_open_facility[2,1,1]: - y[1] + x[2,1,1] <= 0
 assign_to_open_facility[2,1,2]: - y[1] + x[2,1,2] <= 0
 assign_to_open_facility[2,1,3]: - y[1] + x[2,1,3] <= 0
 assign_to_open_facility[2,2,1]: - y[2] + x[2,2,1] <= 0
 assign_to_open_facility[2,2,2]: - y[2] + x[2,2,2] <= 0
 assign_to_open_facility[2,2,3]: - y[2] + x[2,2,3] <= 0
 assign_to_open_facility[2,3,1]: - y[3] + x[2,3,1] <= 0
 assign_to_open_facility[2,3,2]: - y[3] + x[2,3,2] <= 0
 assign_to_open_facility[2,3,3]: - y[3] + x[2,3,3] <= 0
 assign_to_open_facility[2,4,1]: - y[4] + x[2,4,1] <= 0
 assign_to_open_facility[2,4,2]: - y[4] + x[2,4,2] <= 0
 assign_to_open_facility[2,4,3]: - y[4] + x[2,4,3] <= 0
 assign_to_open_facility[2,5,1]: - y[5] + x[2,5,1] <= 0
 assign_to_open_facility[2,5,2]: - y[5] + x[2,5,2] <= 0
 assign_to_open_facility[2,5,3]: - y[5] + x[2,5,3] <= 0
 assign_to_open_facility[2,6,1]: - y[6] + x[2,6,1] <= 0
 assign_to_open_facility[2,6,2]: - y[6] + x[2,6,2] <= 0
 assign_to_open_facility[2,6,3]: - y[6] + x[2,6,3] <= 0
 assign_to_open_facility[3,1,1]: - y[1] + x[3,1,1] <= 0
 assign_to_open_facility[3,1,2]: - y[1] + x[3,1,2] <= 0
 assign_to_open_facility[3,1,3]: - y[1] + x[3,1,3] <= 0
 assign_to_open_facility[3,2,1]: - y[2] + x[3,2,1] <= 0
 assign_to_open_facility[3,2,2]: - y[2] + x[3,2,2] <= 0
 assign_to_open_facility[3,2,3]: - y[2] + x[3,2,3] <= 0
 assign_to_open_facility[3,3,1]: - y[3] + x[3,3,1] <= 0
 assign_to_open_facility[3,3,2]: - y[3] + x[3,3,2] <= 0
 assign_to_open_facility[3,3,3]: - y[3] + x[3,3,3] <= 0
 assign_to_open_facility[3,4,1]: - y[4] + x[3,4,1] <= 0
 assign_to_open_facility[3,4,2]: - y[4] + x[3,4,2] <= 0
 assign_to_open_facility[3,4,3]: - y[4] + x[3,4,3] <= 0
 assign_to_open_facility[3,5,1]: - y[5] + x[3,5,1] <= 0
 assign_to_open_facility[3,5,2]: - y[5] + x[3,5,2] <= 0
 assign_to_open_facility[3,5,3]: - y[5] + x[3,5,3] <= 0
 assign_to_open_facility[3,6,1]: - y[6] + x[3,6,1] <= 0
 assign_to_open_facility[3,6,2]: - y[6] + x[3,6,2] <= 0
 assign_to_open_facility[3,6,3]: - y[6] + x[3,6,3] <= 0
 assign_to_open_facility[4,1,1]: - y[1] + x[4,1,1] <= 0
 assign_to_open_facility[4,1,2]: - y[1] + x[4,1,2] <= 0
 assign_to_open_facility[4,1,3]: - y[1] + x[4,1,3] <= 0
 assign_to_open_facility[4,2,1]: - y[2] + x[4,2,1] <= 0
 assign_to_open_facility[4,2,2]: - y[2] + x[4,2,2] <= 0
 assign_to_open_facility[4,2,3]: - y[2] + x[4,2,3] <= 0
 assign_to_open_facility[4,3,1]: - y[3] + x[4,3,1] <= 0
 assign_to_open_facility[4,3,2]: - y[3] + x[4,3,2] <= 0
 assign_to_open_facility[4,3,3]: - y[3] + x[4,3,3] <= 0
 assign_to_open_facility[4,4,1]: - y[4] + x[4,4,1] <= 0
 assign_to_open_facility[4,4,2]: - y[4] + x[4,4,2] <= 0
 assign_to_open_facility[4,4,3]: - y[4] + x[4,4,3] <= 0
 assign_to_open_facility[4,5,1]: - y[5] + x[4,5,1] <= 0
 assign_to_open_facility[4,5,2]: - y[5] + x[4,5,2] <= 0
 assign_to_open_facility[4,5,3]: - y[5] + x[4,5,3] <= 0
 assign_to_open_facility[4,6,1]: - y[6] + x[4,6,1] <= 0
 assign_to_open_facility[4,6,2]: - y[6] + x[4,6,2] <= 0
 assign_to_open_facility[4,6,3]: - y[6] + x[4,6,3] <= 0
 assign_to_open_facility[5,1,1]: - y[1] + x[5,1,1] <= 0
 assign_to_open_facility[5,1,2]: - y[1] + x[5,1,2] <= 0
 assign_to_open_facility[5,1,3]: - y[1] + x[5,1,3] <= 0
 assign_to_open_facility[5,2,1]: - y[2] + x[5,2,1] <= 0
 assign_to_open_facility[5,2,2]: - y[2] + x[5,2,2] <= 0
 assign_to_open_facility[5,2,3]: - y[2] + x[5,2,3] <= 0
 assign_to_open_facility[5,3,1]: - y[3] + x[5,3,1] <= 0
 assign_to_open_facility[5,3,2]: - y[3] + x[5,3,2] <= 0
 assign_to_open_facility[5,3,3]: - y[3] + x[5,3,3] <= 0
 assign_to_open_facility[5,4,1]: - y[4] + x[5,4,1] <= 0
 assign_to_open_facility[5,4,2]: - y[4] + x[5,4,2] <= 0
 assign_to_open_facility[5,4,3]: - y[4] + x[5,4,3] <= 0
 assign_to_open_facility[5,5,1]: - y[5] + x[5,5,1] <= 0
 assign_to_open_facility[5,5,2]: - y[5] + x[5,5,2] <= 0
 assign_to_open_facility[5,5,3]: - y[5] + x[5,5,3] <= 0
 assign_to_open_facility[5,6,1]: - y[6] + x[5,6,1] <= 0
 assign_to_open_facility[5,6,2]: - y[6] + x[5,6,2] <= 0
 assign_to_open_facility[5,6,3]: - y[6] + x[5,6,3] <= 0
 assignment_capacity[1,1]: - w[1] + 6 x[1,1,1] + 7 x[2,1,1] + 10 x[3,1,1]
   + 7 x[4,1,1] + 6 x[5,1,1] <= 0
 assignment_capacity[1,2]: - w[1] + 8 x[1,1,2] + 9 x[2,1,2] + 8 x[3,1,2]
   + 5 x[4,1,2] + 7 x[5,1,2] <= 0
 assignment_capacity[1,3]: - w[1] + 9 x[1,1,3] + 5 x[2,1,3] + 6 x[3,1,3]
   + 9 x[4,1,3] + 7 x[5,1,3] <= 0
 assignment_capacity[2,1]: - w[2] + 6 x[1,2,1] + 7 x[2,2,1] + 10 x[3,2,1]
   + 7 x[4,2,1] + 6 x[5,2,1] <= 0
 assignment_capacity[2,2]: - w[2] + 8 x[1,2,2] + 9 x[2,2,2] + 8 x[3,2,2]
   + 5 x[4,2,2] + 7 x[5,2,2] <= 0
 assignment_capacity[2,3]: - w[2] + 9 x[1,2,3] + 5 x[2,2,3] + 6 x[3,2,3]
   + 9 x[4,2,3] + 7 x[5,2,3] <= 0
 assignment_capacity[3,1]: - w[3] + 6 x[1,3,1] + 7 x[2,3,1] + 10 x[3,3,1]
   + 7 x[4,3,1] + 6 x[5,3,1] <= 0
 assignment_capacity[3,2]: - w[3] + 8 x[1,3,2] + 9 x[2,3,2] + 8 x[3,3,2]
   + 5 x[4,3,2] + 7 x[5,3,2] <= 0
 assignment_capacity[3,3]: - w[3] + 9 x[1,3,3] + 5 x[2,3,3] + 6 x[3,3,3]
   + 9 x[4,3,3] + 7 x[5,3,3] <= 0
 assignment_capacity[4,1]: - w[4] + 6 x[1,4,1] + 7 x[2,4,1] + 10 x[3,4,1]
   + 7 x[4,4,1] + 6 x[5,4,1] <= 0
 assignment_capacity[4,2]: - w[4] + 8 x[1,4,2] + 9 x[2,4,2] + 8 x[3,4,2]
   + 5 x[4,4,2] + 7 x[5,4,2] <= 0
 assignment_capacity[4,3]: - w[4] + 9 x[1,4,3] + 5 x[2,4,3] + 6 x[3,4,3]
   + 9 x[4,4,3] + 7 x[5,4,3] <= 0
 assignment_capacity[5,1]: - w[5] + 6 x[1,5,1] + 7 x[2,5,1] + 10 x[3,5,1]
   + 7 x[4,5,1] + 6 x[5,5,1] <= 0
 assignment_capacity[5,2]: - w[5] + 8 x[1,5,2] + 9 x[2,5,2] + 8 x[3,5,2]
   + 5 x[4,5,2] + 7 x[5,5,2] <= 0
 assignment_capacity[5,3]: - w[5] + 9 x[1,5,3] + 5 x[2,5,3] + 6 x[3,5,3]
   + 9 x[4,5,3] + 7 x[5,5,3] <= 0
 assignment_capacity[6,1]: - w[6] + 6 x[1,6,1] + 7 x[2,6,1] + 10 x[3,6,1]
   + 7 x[4,6,1] + 6 x[5,6,1] <= 0
 assignment_capacity[6,2]: - w[6] + 8 x[1,6,2] + 9 x[2,6,2] + 8 x[3,6,2]
   + 5 x[4,6,2] + 7 x[5,6,2] <= 0
 assignment_capacity[6,3]: - w[6] + 9 x[1,6,3] + 5 x[2,6,3] + 6 x[3,6,3]
   + 9 x[4,6,3] + 7 x[5,6,3] <= 0
 demand_fulfillment[1,1]: x[1,1,1] + x[1,2,1] + x[1,3,1] + x[1,4,1]
   + x[1,5,1] + x[1,6,1] = 1
 demand_fulfillment[1,2]: x[1,1,2] + x[1,2,2] + x[1,3,2] + x[1,4,2]
   + x[1,5,2] + x[1,6,2] = 1
 demand_fulfillment[1,3]: x[1,1,3] + x[1,2,3] + x[1,3,3] + x[1,4,3]
   + x[1,5,3] + x[1,6,3] = 1
 demand_fulfillment[2,1]: x[2,1,1] + x[2,2,1] + x[2,3,1] + x[2,4,1]
   + x[2,5,1] + x[2,6,1] = 1
 demand_fulfillment[2,2]: x[2,1,2] + x[2,2,2] + x[2,3,2] + x[2,4,2]
   + x[2,5,2] + x[2,6,2] = 1
 demand_fulfillment[2,3]: x[2,1,3] + x[2,2,3] + x[2,3,3] + x[2,4,3]
   + x[2,5,3] + x[2,6,3] = 1
 demand_fulfillment[3,1]: x[3,1,1] + x[3,2,1] + x[3,3,1] + x[3,4,1]
   + x[3,5,1] + x[3,6,1] = 1
 demand_fulfillment[3,2]: x[3,1,2] + x[3,2,2] + x[3,3,2] + x[3,4,2]
   + x[3,5,2] + x[3,6,2] = 1
 demand_fulfillment[3,3]: x[3,1,3] + x[3,2,3] + x[3,3,3] + x[3,4,3]
   + x[3,5,3] + x[3,6,3] = 1
 demand_fulfillment[4,1]: x[4,1,1] + x[4,2,1] + x[4,3,1] + x[4,4,1]
   + x[4,5,1] + x[4,6,1] = 1
 demand_fulfillment[4,2]: x[4,1,2] + x[4,2,2] + x[4,3,2] + x[4,4,2]
   + x[4,5,2] + x[4,6,2] = 1
 demand_fulfillment[4,3]: x[4,1,3] + x[4,2,3] + x[4,3,3] + x[4,4,3]
   + x[4,5,3] + x[4,6,3] = 1
 demand_fulfillment[5,1]: x[5,1,1] + x[5,2,1] + x[5,3,1] + x[5,4,1]
   + x[5,5,1] + x[5,6,1] = 1
 demand_fulfillment[5,2]: x[5,1,2] + x[5,2,2] + x[5,3,2] + x[5,4,2]
   + x[5,5,2] + x[5,6,2] = 1
 demand_fulfillment[5,3]: x[5,1,3] + x[5,2,3] + x[5,3,3] + x[5,4,3]
   + x[5,5,3] + x[5,6,3] = 1
 facility_capacity[1]: - 30 y[1] + w[1] <= 0
 facility_capacity[2]: - 30 y[2] + w[2] <= 0
 facility_capacity[3]: - 30 y[3] + w[3] <= 0
 facility_capacity[4]: - 30 y[4] + w[4] <= 0
 facility_capacity[5]: - 30 y[5] + w[5] <= 0
 facility_capacity[6]: - 30 y[6] + w[6] <= 0
 number_of_facilities: y[1] + y[2] + y[3] + y[4] + y[5] + y[6] <= 3
 non_negativity[1]: w[1] >= 0
 non_negativity[2]: w[2] >= 0
 non_negativity[3]: w[3] >= 0
 non_negativity[4]: w[4] >= 0
 non_negativity[5]: w[5] >= 0
 non_negativity[6]: w[6] >= 0
 non_negativity[1,1,1]: x[1,1,1] >= 0
 non_negativity[1,1,2]: x[1,1,2] >= 0
 non_negativity[1,1,3]: x[1,1,3] >= 0
 non_negativity[1,2,1]: x[1,2,1] >= 0
 non_negativity[1,2,2]: x[1,2,2] >= 0
 non_negativity[1,2,3]: x[1,2,3] >= 0
 non_negativity[1,3,1]: x[1,3,1] >= 0
 non_negativity[1,3,2]: x[1,3,2] >= 0
 non_negativity[1,3,3]: x[1,3,3] >= 0
 non_negativity[1,4,1]: x[1,4,1] >= 0
 non_negativity[1,4,2]: x[1,4,2] >= 0
 non_negativity[1,4,3]: x[1,4,3] >= 0
 non_negativity[1,5,1]: x[1,5,1] >= 0
 non_negativity[1,5,2]: x[1,5,2] >= 0
 non_negativity[1,5,3]: x[1,5,3] >= 0
 non_negativity[1,6,1]: x[1,6,1] >= 0
 non_negativity[1,6,2]: x[1,6,2] >= 0
 non_negativity[1,6,3]: x[1,6,3] >= 0
 non_negativity[2,1,1]: x[2,1,1] >= 0
 non_negativity[2,1,2]: x[2,1,2] >= 0
 non_negativity[2,1,3]: x[2,1,3] >= 0
 non_negativity[2,2,1]: x[2,2,1] >= 0
 non_negativity[2,2,2]: x[2,2,2] >= 0
 non_negativity[2,2,3]: x[2,2,3] >= 0
 non_negativity[2,3,1]: x[2,3,1] >= 0
 non_negativity[2,3,2]: x[2,3,2] >= 0
 non_negativity[2,3,3]: x[2,3,3] >= 0
 non_negativity[2,4,1]: x[2,4,1] >= 0
 non_negativity[2,4,2]: x[2,4,2] >= 0
 non_negativity[2,4,3]: x[2,4,3] >= 0
 non_negativity[2,5,1]: x[2,5,1] >= 0
 non_negativity[2,5,2]: x[2,5,2] >= 0
 non_negativity[2,5,3]: x[2,5,3] >= 0
 non_negativity[2,6,1]: x[2,6,1] >= 0
 non_negativity[2,6,2]: x[2,6,2] >= 0
 non_negativity[2,6,3]: x[2,6,3] >= 0
 non_negativity[3,1,1]: x[3,1,1] >= 0
 non_negativity[3,1,2]: x[3,1,2] >= 0
 non_negativity[3,1,3]: x[3,1,3] >= 0
 non_negativity[3,2,1]: x[3,2,1] >= 0
 non_negativity[3,2,2]: x[3,2,2] >= 0
 non_negativity[3,2,3]: x[3,2,3] >= 0
 non_negativity[3,3,1]: x[3,3,1] >= 0
 non_negativity[3,3,2]: x[3,3,2] >= 0
 non_negativity[3,3,3]: x[3,3,3] >= 0
 non_negativity[3,4,1]: x[3,4,1] >= 0
 non_negativity[3,4,2]: x[3,4,2] >= 0
 non_negativity[3,4,3]: x[3,4,3] >= 0
 non_negativity[3,5,1]: x[3,5,1] >= 0
 non_negativity[3,5,2]: x[3,5,2] >= 0
 non_negativity[3,5,3]: x[3,5,3] >= 0
 non_negativity[3,6,1]: x[3,6,1] >= 0
 non_negativity[3,6,2]: x[3,6,2] >= 0
 non_negativity[3,6,3]: x[3,6,3] >= 0
 non_negativity[4,1,1]: x[4,1,1] >= 0
 non_negativity[4,1,2]: x[4,1,2] >= 0
 non_negativity[4,1,3]: x[4,1,3] >= 0
 non_negativity[4,2,1]: x[4,2,1] >= 0
 non_negativity[4,2,2]: x[4,2,2] >= 0
 non_negativity[4,2,3]: x[4,2,3] >= 0
 non_negativity[4,3,1]: x[4,3,1] >= 0
 non_negativity[4,3,2]: x[4,3,2] >= 0
 non_negativity[4,3,3]: x[4,3,3] >= 0
 non_negativity[4,4,1]: x[4,4,1] >= 0
 non_negativity[4,4,2]: x[4,4,2] >= 0
 non_negativity[4,4,3]: x[4,4,3] >= 0
 non_negativity[4,5,1]: x[4,5,1] >= 0
 non_negativity[4,5,2]: x[4,5,2] >= 0
 non_negativity[4,5,3]: x[4,5,3] >= 0
 non_negativity[4,6,1]: x[4,6,1] >= 0
 non_negativity[4,6,2]: x[4,6,2] >= 0
 non_negativity[4,6,3]: x[4,6,3] >= 0
 non_negativity[5,1,1]: x[5,1,1] >= 0
 non_negativity[5,1,2]: x[5,1,2] >= 0
 non_negativity[5,1,3]: x[5,1,3] >= 0
 non_negativity[5,2,1]: x[5,2,1] >= 0
 non_negativity[5,2,2]: x[5,2,2] >= 0
 non_negativity[5,2,3]: x[5,2,3] >= 0
 non_negativity[5,3,1]: x[5,3,1] >= 0
 non_negativity[5,3,2]: x[5,3,2] >= 0
 non_negativity[5,3,3]: x[5,3,3] >= 0
 non_negativity[5,4,1]: x[5,4,1] >= 0
 non_negativity[5,4,2]: x[5,4,2] >= 0
 non_negativity[5,4,3]: x[5,4,3] >= 0
 non_negativity[5,5,1]: x[5,5,1] >= 0
 non_negativity[5,5,2]: x[5,5,2] >= 0
 non_negativity[5,5,3]: x[5,5,3] >= 0
 non_negativity[5,6,1]: x[5,6,1] >= 0
 non_negativity[5,6,2]: x[5,6,2] >= 0
 non_negativity[5,6,3]: x[5,6,3] >= 0
 upper_bound[1,1,1]: x[1,1,1] <= 1
 upper_bound[1,1,2]: x[1,1,2] <= 1
 upper_bound[1,1,3]: x[1,1,3] <= 1
 upper_bound[1,2,1]: x[1,2,1] <= 1
 upper_bound[1,2,2]: x[1,2,2] <= 1
 upper_bound[1,2,3]: x[1,2,3] <= 1
 upper_bound[1,3,1]: x[1,3,1] <= 1
 upper_bound[1,3,2]: x[1,3,2] <= 1
 upper_bound[1,3,3]: x[1,3,3] <= 1
 upper_bound[1,4,1]: x[1,4,1] <= 1
 upper_bound[1,4,2]: x[1,4,2] <= 1
 upper_bound[1,4,3]: x[1,4,3] <= 1
 upper_bound[1,5,1]: x[1,5,1] <= 1
 upper_bound[1,5,2]: x[1,5,2] <= 1
 upper_bound[1,5,3]: x[1,5,3] <= 1
 upper_bound[1,6,1]: x[1,6,1] <= 1
 upper_bound[1,6,2]: x[1,6,2] <= 1
 upper_bound[1,6,3]: x[1,6,3] <= 1
 upper_bound[2,1,1]: x[2,1,1] <= 1
 upper_bound[2,1,2]: x[2,1,2] <= 1
 upper_bound[2,1,3]: x[2,1,3] <= 1
 upper_bound[2,2,1]: x[2,2,1] <= 1
 upper_bound[2,2,2]: x[2,2,2] <= 1
 upper_bound[2,2,3]: x[2,2,3] <= 1
 upper_bound[2,3,1]: x[2,3,1] <= 1
 upper_bound[2,3,2]: x[2,3,2] <= 1
 upper_bound[2,3,3]: x[2,3,3] <= 1
 upper_bound[2,4,1]: x[2,4,1] <= 1
 upper_bound[2,4,2]: x[2,4,2] <= 1
 upper_bound[2,4,3]: x[2,4,3] <= 1
 upper_bound[2,5,1]: x[2,5,1] <= 1
 upper_bound[2,5,2]: x[2,5,2] <= 1
 upper_bound[2,5,3]: x[2,5,3] <= 1
 upper_bound[2,6,1]: x[2,6,1] <= 1
 upper_bound[2,6,2]: x[2,6,2] <= 1
 upper_bound[2,6,3]: x[2,6,3] <= 1
 upper_bound[3,1,1]: x[3,1,1] <= 1
 upper_bound[3,1,2]: x[3,1,2] <= 1
 upper_bound[3,1,3]: x[3,1,3] <= 1
 upper_bound[3,2,1]: x[3,2,1] <= 1
 upper_bound[3,2,2]: x[3,2,2] <= 1
 upper_bound[3,2,3]: x[3,2,3] <= 1
 upper_bound[3,3,1]: x[3,3,1] <= 1
 upper_bound[3,3,2]: x[3,3,2] <= 1
 upper_bound[3,3,3]: x[3,3,3] <= 1
 upper_bound[3,4,1]: x[3,4,1] <= 1
 upper_bound[3,4,2]: x[3,4,2] <= 1
 upper_bound[3,4,3]: x[3,4,3] <= 1
 upper_bound[3,5,1]: x[3,5,1] <= 1
 upper_bound[3,5,2]: x[3,5,2] <= 1
 upper_bound[3,5,3]: x[3,5,3] <= 1
 upper_bound[3,6,1]: x[3,6,1] <= 1
 upper_bound[3,6,2]: x[3,6,2] <= 1
 upper_bound[3,6,3]: x[3,6,3] <= 1
 upper_bound[4,1,1]: x[4,1,1] <= 1
 upper_bound[4,1,2]: x[4,1,2] <= 1
 upper_bound[4,1,3]: x[4,1,3] <= 1
 upper_bound[4,2,1]: x[4,2,1] <= 1
 upper_bound[4,2,2]: x[4,2,2] <= 1
 upper_bound[4,2,3]: x[4,2,3] <= 1
 upper_bound[4,3,1]: x[4,3,1] <= 1
 upper_bound[4,3,2]: x[4,3,2] <= 1
 upper_bound[4,3,3]: x[4,3,3] <= 1
 upper_bound[4,4,1]: x[4,4,1] <= 1
 upper_bound[4,4,2]: x[4,4,2] <= 1
 upper_bound[4,4,3]: x[4,4,3] <= 1
 upper_bound[4,5,1]: x[4,5,1] <= 1
 upper_bound[4,5,2]: x[4,5,2] <= 1
 upper_bound[4,5,3]: x[4,5,3] <= 1
 upper_bound[4,6,1]: x[4,6,1] <= 1
 upper_bound[4,6,2]: x[4,6,2] <= 1
 upper_bound[4,6,3]: x[4,6,3] <= 1
 upper_bound[5,1,1]: x[5,1,1] <= 1
 upper_bound[5,1,2]: x[5,1,2] <= 1
 upper_bound[5,1,3]: x[5,1,3] <= 1
 upper_bound[5,2,1]: x[5,2,1] <= 1
 upper_bound[5,2,2]: x[5,2,2] <= 1
 upper_bound[5,2,3]: x[5,2,3] <= 1
 upper_bound[5,3,1]: x[5,3,1] <= 1
 upper_bound[5,3,2]: x[5,3,2] <= 1
 upper_bound[5,3,3]: x[5,3,3] <= 1
 upper_bound[5,4,1]: x[5,4,1] <= 1
 upper_bound[5,4,2]: x[5,4,2] <= 1
 upper_bound[5,4,3]: x[5,4,3] <= 1
 upper_bound[5,5,1]: x[5,5,1] <= 1
 upper_bound[5,5,2]: x[5,5,2] <= 1
 upper_bound[5,5,3]: x[5,5,3] <= 1
 upper_bound[5,6,1]: x[5,6,1] <= 1
 upper_bound[5,6,2]: x[5,6,2] <= 1
 upper_bound[5,6,3]: x[5,6,3] <= 1
Bounds
Binaries
 y[1] y[2] y[3] y[4] y[5] y[6]
End
