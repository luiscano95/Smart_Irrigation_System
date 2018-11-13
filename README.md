# Smart City Park Irrigation System
This is the repository for the paper titled "Smart City Park Irrigation System: A Case Study of San Isidro, Lima Perú" published here [![Paper](https://github.com/luiscano95/Smart_Irrigation_System/blob/master/svg/mdpi-logo.svg)](https://www.mdpi.com/2504-3900/2/19/1227)

# Abstract:
Water management has become a global priority in recent decades. The demand for water
resources is increasing in cities due to the increase in population and the intensive use of water in
economic activities and ornamentation. The problem is exacerbated when cities are built on desert
regions, this is the case of Lima which is the second largest city built on a desert after Cairo. In this
type of cities, it is necessary to minimize water consumption in activities that do not cover the priority
needs of the population. For this reason, one of the most important tasks in the management of water
resources in Lima is the optimization of water use in irrigation of parks, malls and other public green
areas, necessary to offer a good quality of life to citizens. This research develops a smart decision
support system to optimize irrigation in city parks. The proposed methodology takes 4 variables:
land area, temperature, park humidity and weather forecast. First, strategic segmentation of the total
area of the park is carried out, followed by the use of low-cost sensors to construct real-time humidity
and temperature maps of the land area. Afterwards, a fuzzy inference system (FIS) that incorporates
the knowledge of agronomists to process vague information in terms of computer interpretable
language, together with the data collected from the variables and humidity and temperature maps is
built, to assess the need for irrigation of each segment of the park. A dashboard is made to facilitate
the visualization of results, including humidity and temperature maps, the weather forecast for the
area and the recommendation of the FIS, which supports decision-making on irrigation needs in each
segment of the park. The methodology was applied in a case study that corresponds to a San Isidro
park in the city of Lima. Significant expected savings were obtained in terms of water resources and
monetary units, which demonstrates the viability of the application of this smart system oriented at
supporting decision-making on smart irrigation in the city’s parks.

# Main Results

The following table shows the performance of the four tested interpolation functions, the idea behind testing different interpolation functions was to find the one that performs better with our dataset. The Radial Basis Function (RBF) obtained the best performance in terms of mean absolute percentage error (MAPE), mean squared error (MSE) and root mean squared error (RMSE).

| Method/Error  | MAPE | MSE | RMSE | 
| ------------- | ------------- | ------------ | ------------- |
| Bilinear  | 124.0471  | 1152.7025 | 33.9514  |
| 2D Nearest Neighbour  | 144.1189  | 1935.5560 | 43.9949  |
| Bicubic  | 123.6736  | 1066.5454 | 32.6580  |
| RBF  | 11.3904  | 107.3625 | 10.3615  |


The proposed Fuzzy inference system (FIS) has 2 inputs, humidity with values from 1 to 100 (this unit represents the output voltage converted into the sensor humidity scale) and temperature with values from 14 to 30 (Celsius) for each quadrant. This can be seen in the following image:

![alt text](https://github.com/luiscano95/Smart_Irrigation_System/blob/master/Images/fis_smart.png)

There are 9 rules in the FIS, these rules were validated with the local authorities and the local agronomists in charge of the irrigation of the park, these rules are presented as follows:

* If (Humidity is Low) and (Temperature is Low) then (Score is Low)
* If (Humidity is Low) and (Temperature is Medium) then (Score is Low)
* If (Humidity is Low) and (Temperature is High) then (Score is Low)
* If (Humidity is Medium) and (Temperature is Low) then (Score is High)
* If (Humidity is Medium) and (Temperature is Medium) then (Score is Medium)
* If (Humidity is Medium) and (Temperature is High) then (Score is Medium)
* If (Humidity is High) and (Temperature is Low) then (Score is High)
* If (Humidity is High) and (Temperature is Medium) then (Score is High)
* If (Humidity is High) and (Temperature is High) then (Score is Medium)

The maximum and the minimum water usage and the cost associated with the prices obtained from the district’s water supplier, sedapal were estimated in order to evaluate the performance of the proposed irrigation methodology. Nowadays, the park is irrigated by sprinklers, each sprinkler expels between 1500 to 2000 litres of water per hour. With this information, the minimum and maximum water used by the 50 sprinklers for 15 minutes a day, is estimated for a year. This information is summarized in the following table:


|                          |     | Annual Expenditure (In Cubic Decimeters) | Annual Expenditure (In Soles) |
|:------------------------:|:---:|:----------------------------------------:|:-----------------------------:|
|    Current Irrigation    | Min |                 6,750,000                |         S/. 15,930.00         |
|                          | Max |                 9,000,000                |         S/. 21,240.00         |
| Irrigation based on data | Min |                 3,918,750                |          S/. 9,248.25         |
|                          | Max |                 5,225,000                |         S/. 12,331.00         |
|          Savings         | Min |                 2,831,250                |          S/. 6,681.75         |
|                          | Max |                 3,775,000                |          S/. 8,909.00         |

As shown in the table, the annual expenditure savings in terms of cubic decimeters is very high, with an averages savings of 3,303,125 cubic decimeters. Although the monetary saving is not so high, this is because the state currently subsidizes the water and makes the expenditure significantly less than in other Latin American countries.

The proposed dashboard can be seen in the following image, there are 4 important figures: First, humidity and temperature maps for the park are presented to achieve real-time monitoring of the soil humidity and quadrant temperature. The humidity map of the park was constructed using the values obtained through the interpolation of the data collected by sensors, the temperature map was constructed using the average temperature from the total quadrant since the variations for the 18 points were not significant enough, this is because a variation of 1 or 2 units does not represent a big impact in the score calculated. Then, the hourly precipitation forecast for the day is presented, this forecast helps the agronomists in the decision of when to water the park. Finally, the dashboard also presents the fuzzy inference system output (scores) by quadrant with the recommendation interval given by the
experts. The scores provide a clear measurement of the quality of the soil for each quadrant to the agronomists. In a real case scenario, the experts would combine the forecast, the maps and the score to take appropriate decisions for irrigation. For example, if the scores values of the quadrants are low but the precipitation forecast indicates that it is very likely to rain in the next hours the recommendation would be to not water the park.

![alt text](https://github.com/luiscano95/Smart_Irrigation_System/blob/master/Images/dashboard_v2%20(1).svg)
