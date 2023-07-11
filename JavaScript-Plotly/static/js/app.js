// filtering key parameters to evaluate quality of air in US,CA and MX
//**********************************************************************/
//                           Parameter pm10
//**********************************************************************/
//Parameter pm10
var filterParamPm10 = data.filter(a => a.parameter == "pm10");
console.log("filtered Param for pm10 data: ", filterParamPm10);

// Calculate the sums and group data (while tracking count)
   const reduced = filterParamPm10.reduce(function(m, d){
    if(!m[d.country]){
      m[d.country] = {...d, value:0, count: 1};
      return m;
    }
     m[d.country].value += parseFloat(d.value);
    m[d.country].count += 1;
    return m;
  },{});
  
  // Create new array from grouped data and compute the average
  const pm10resultCount = Object.keys(reduced).map(function(k){
     const item  = reduced[k];
     return {
         country: item.country
     }
  })
  // Create new array from grouped data and compute the average
  const pm10resultAvg = Object.keys(reduced).map(function(k){
    const item  = reduced[k];
    return {
          pm10avgValue: item.value/item.count
    }
 }) 
// Create bar chart using plotly for pm10
 // Country name
    namespm10 = pm10resultCount.map(function (row){
        return row.country
       });
     console.log("country: ",namespm10);
    
     pm10avg = pm10resultAvg.map(function (row){
        return row.pm10avgValue
      });
     console.log("pm10 for chart",pm10avg);
 
     // Initializes the page with a default plot
function init() {
  data = [{
    x: namespm10,
    y: pm10avg ,
    type:"bar"
    }];
    var layout = {
      title: 'Average Element'
    };
 
  Plotly.newPlot("plot", data, layout);
};
//**********************************************************************/
//                           Parameter pm25
//**********************************************************************/
var filterParamPm25 = data.filter(a => a.parameter == "pm25");
console.log("filtered Param for pm25 data: ", filterParamPm25);

// Calculate the sums and group data (while tracking count)
   const reducedpm25 = filterParamPm25.reduce(function(m, d){
    if(!m[d.country]){
      m[d.country] = {...d, value:0, count: 1};
      return m;
    }
     m[d.country].value += parseFloat(d.value);
    m[d.country].count += 1;
    return m;
  },{});
  
  // Create new array from grouped data and compute the average
  const pm25resultCount = Object.keys(reducedpm25).map(function(k){
     const item  = reducedpm25[k];
     return {
         country: item.country
     }
  })
  // Create new array from grouped data and compute the average
  const pm25resultAvg = Object.keys(reducedpm25).map(function(k){
    const item  = reducedpm25[k];
    return {
          pm25avgValue: item.value/item.count
    }
 }) 
// Create bar chart using plotly for pm25
 // Country name
    namespm25 = pm25resultCount.map(function (row){
        return row.country
       });
     console.log("country: ",namespm25);
    
     pm25avg = pm25resultAvg.map(function (row){
        return row.pm25avgValue
      });
     console.log("pm25 for chart",pm25avg);

//**********************************************************************/
//                           Parameter temperature
//**********************************************************************/
var filterParamTemp = data.filter(a => a.parameter == "temperature");
console.log("filtered Param for temperature data: ", filterParamTemp);

// Calculate the sums and group data (while tracking count)
   const reducedTemp = filterParamTemp.reduce(function(m, d){
    if(!m[d.country]){
      m[d.country] = {...d, value:0, count: 1};
      return m;
    }
     m[d.country].value += parseFloat(d.value);
    m[d.country].count += 1;
    return m;
  },{});
  
  // Create new array from grouped data and compute the average
  const tempresultCount = Object.keys(reducedTemp).map(function(k){
     const item  = reducedTemp[k];
     return {
         country: item.country
     }
  })
  // Create new array from grouped data and compute the average
  const tempresultAvg = Object.keys(reducedTemp).map(function(k){
    const item  = reducedTemp[k];
    return {
          tempavgValue: item.value/item.count
    }
 }) 
// Create bar chart using plotly for avg.Temparature
 // Country name
    namesTemp = tempresultCount.map(function (row){
        return row.country
       });
     console.log("country: ",namesTemp);
    
     tempavg = tempresultAvg.map(function (row){
        return row.tempavgValue
      });
     console.log("temp for chart",tempavg);

//**********************************************************************/
//                           Parameter Pressure
//**********************************************************************/
var filterParamPres = data.filter(a => a.parameter == "pressure");
console.log("filtered Param for pm25 data: ", filterParamPres);

// Calculate the sums and group data (while tracking count)
   const reducedPres = filterParamPres.reduce(function(m, d){
    if(!m[d.country]){
      m[d.country] = {...d, value:0, count: 1};
      return m;
    }
     m[d.country].value += parseFloat(d.value);
    m[d.country].count += 1;
    return m;
  },{});
  
  // Create new array from grouped data and compute the average
  const presresultCount = Object.keys(reducedPres).map(function(k){
     const item  = reducedPres[k];
     return {
         country: item.country
     }
  })
  // Create new array from grouped data and compute the average
  const presresultAvg = Object.keys(reducedPres).map(function(k){
    const item  = reducedPres[k];
    return {
          presavgValue: item.value/item.count
    }
 }) 
// Create bar chart using plotly for pressure
 // Country name
    namesPres = presresultCount.map(function (row){
        return row.country
       });
     console.log("country: ",namesPres);
    
     presavg = presresultAvg.map(function (row){
        return row.presavgValue
      });
     console.log("Pressure chart",presavg);

//***************************************************************************************************************/
 // Call updatePlotly() when a change takes place to the DOM
d3.selectAll("#selParameter").on("change", updatePlotly);
// This function is called when a dropdown menu item is selected
function updatePlotly() {
  // Use D3 to select the dropdown menu
  let dropdownMenu = d3.select("#selParameter");
  // Assign the value of the dropdown menu option to a variable
  let parm = dropdownMenu.property("value");
  let parm1 = dropdownMenu.property("value");

    // Initialize x and y arrays
    let x = [];
    let y = []; 
    let layout1 = []; 
    let type = []; 

// Trace for the pm10 avg value Data
    if (parm === 'dataset1')    
          {
          x= namespm10, //data.map(row => row.country),
          y= pm10avg,  //data.map(row => row.pm10avgValue),
          type= "bar"
          }     
        //  layout1 = {
        //   title = "pm10 avg particles in atmosphere"
        //   };
    else if (parm === 'dataset2')  {
          x= namespm25, //data.map(row => row.country),
          y= pm25avg,  //data.map(row => row.pm10avgValue),
          type= "bar",
          title = "pm10 avg particles in atmosphere"
          }
          // // Apply the title to the layout
          // layout1 = {
          //   title: "pm25 avg particles in atmosphere"
          //   };
    else if (parm === 'dataset3')  {
           x= namesTemp, //data.map(row => row.country),
           y= tempavg,  //data.map(row => row.pm10avgValue),
           type= "bar",
           title = "pm25 avg particles in atmosphere"
           }
          //  // Apply the title to the layout
          //  layout1 = {
          //   title: "Average Temparate by Country "
          //   };
    else if (parm === 'dataset4')  {
           x= namesPres, //data.map(row => row.country),
           y= presavg,  //data.map(row => row.pm10avgValue),
           type= "bar",
           title = "Average temparature"
           }
 
    // Note the extra brackets around 'x' and 'y'
     Plotly.restyle("plot", "x", [x]);
     Plotly.restyle("plot", "y", [y]);
     Plotly.restyle("plot", "type", [type]);
     Plotly.restyle("plot", "title",[title] );
}
init();
