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





![alt text](http://url/to/img.png)
