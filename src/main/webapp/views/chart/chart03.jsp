<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%-- //jstl을 쓰겠다는 뜻!!
c 로 쓰겠다는것, 그래서 밑에 c:out  으로 쓸 수 있음--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>
<script>
  let chart03 = {
    init:function(){
      this.getdata1();
      this.getdata2();
      this.getdata3();
    },
    getdata1:function(){
      $.ajax({
        url:'/chart0301',
        success:function(result){
          chart03.display1(result);
        }
      });
    },
    getdata2:function(){
      $.ajax({
        url:'/chart0302',
        success:function(result){
          chart03.display2(result);
        }
      });
    },
    getdata3:function(){
      $.ajax({
        url:'/chart0303',
        success:function(result){
          chart03.display3(result);
        }
      });
    },
    display1 :function(result){
      Highcharts.chart('c1', {
        chart: {
          type: 'pie',
          options3d: {
            enabled: true,
            alpha: 45
          }
        },
        title: {
          text: 'Beijing 2022 gold medals by country',
          align: 'left'
        },
        subtitle: {
          text: '3D donut in Highcharts',
          align: 'left'
        },
        plotOptions: {
          pie: {
            innerSize: 100,
            depth: 45
          }
        },
        series: [{
          name: 'Medals',
          data: result
        }]
      });

    },
    display2 :function(result){
      Highcharts.chart('c2', {

        title: {
          text: 'Logarithmic axis demo'
        },

        xAxis: {
          tickInterval: 1,
          type: 'logarithmic',
          accessibility: {
            rangeDescription: 'Range: 1 to 10'
          }
        },

        yAxis: {
          type: 'logarithmic',
          minorTickInterval: 0.1,
          accessibility: {
            rangeDescription: 'Range: 0.1 to 1000'
          }
        },

        tooltip: {
          headerFormat: '<b>{series.name}</b><br />',
          pointFormat: 'x = {point.x}, y = {point.y}'
        },

        series: [{
          data: result,
          pointStart: 1
        }]
      });
    },
    display3 :function(result){
      Highcharts.chart('c3', {
        chart: {
          type: 'funnel'
        },
        title: {
          text: 'Sales funnel'
        },
        plotOptions: {
          series: {
            dataLabels: {
              enabled: true,
              format: '<b>{point.name}</b> ({point.y:,.0f})',
              softConnector: true
            },
            center: ['40%', '50%'],
            neckWidth: '30%',
            neckHeight: '25%',
            width: '80%'
          }
        },
        legend: {
          enabled: false
        },
        series: [{
          name: 'Unique users',
          data: result
        }],

        responsive: {
          rules: [{
            condition: {
              maxWidth: 500
            },
            chartOptions: {
              plotOptions: {
                series: {
                  dataLabels: {
                    inside: true
                  },
                  center: ['50%', '50%'],
                  width: '100%'
                }
              }
            }
          }]
        }
      });
    },
  };
    $(function(){
       chart03.init();
    })
</script>



<div class="col-sm-8 text-left">
  <div class="container">
    <h3 >Chart03</h3>
    <div class="row">
      <div class="col-sm-3" id="c1" class="well"></div>
      <div class="col-sm-3" id="c2"></div>
      <div class="col-sm-3" id="c3"></div>
    </div>

  </div>
</div>