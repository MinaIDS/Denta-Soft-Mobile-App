import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import '../../controllers/DashBoardController.dart';
import '../../utils/SizeandStyleUtills.dart';
import '../../utils/SizesStatic.dart';
import '../../widgets/OnceFutureBuilder.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnceFutureBuilder(
      future: () => DashBoardController().getAllDashboardData(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available'));
        }

        final dataList = snapshot.data as Map<String, dynamic>;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeandStyleUtills().getProportionalHeight(height: 12),
              ),

              // Daily Working Hours For Week
              Text(
                S().DailyWorkedHours,
                style: SizeandStyleUtills().getTextStyleRegular(
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]!,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 320,
                child: Echarts(
                  option:
                      '''
                {
                      tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'cross',
                                crossStyle: {
                                    color: '#999'
                                }
                            }
                      },
                      toolbox: {
                            feature: {
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                            }
                      },
                    
                      yAxis: [
                            {
                                type: 'value',
                                name: '',
                                min: 0,
                                max: ${dataList['dailyWorkedHoursMAXVALUE']},
                                //interval: 10,
                                axisLabel: {
                                    formatter: '{value}'
                                }
                            }
                      ],
                      xAxis: [
                            {
                                type: 'category',
                                data: [${dataList['dailyWorkedHoursKey']}],
                                axisPointer: {
                                    type: 'shadow'
                                },
                                   axisTick: {
                                alignWithLabel: true
                              },
                              axisLabel: {
                                rotate: 45,
                                fontWeight: "bold",
                                fontSize: 12
                              }
                            }
                      ],
                      series: [
                            {
                                name: 'hours:',
                                type: 'bar',
                                data: [${dataList['dailyWorkedHoursValue']}]
                            }
                      ]
                  }
              ''',
                  theme: "light",
                ),
              ),

              SizedBox(
                height: SizeandStyleUtills().getProportionalHeight(height: 20),
              ),

              // Appointments Per Week
              Text(
                S().DailyAppointmentsForWeek,
                style: SizeandStyleUtills().getTextStyleRegular(
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]!,
                ),
              ),
              SizedBox(
                height: SizeandStyleUtills().getProportionalHeight(height: 8),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 320,
                child: Echarts(
                  option:
                      '''
                          {
                      tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'cross',
                                crossStyle: {
                                    color: '#999'
                                }
                            }
                      },
                      toolbox: {
                            feature: {
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                            }
                      },
                    
                      yAxis: [
                            {
                                type: 'value',
                                name: '',
                                min: 0,
                                max: ${dataList['dailyAppointmentAsyncsMAXVALUE']},
                                //interval: 10,
                                axisLabel: {
                                    formatter: '{value}'
                                }
                            }
                      ],
                      xAxis: [
                            {
                                type: 'category',
                                data: [${dataList['dailyAppointmentAsyncsKey']}],
                                axisPointer: {
                                    type: 'shadow'
                                },
                                   axisTick: {
                                alignWithLabel: true
                              },
                              axisLabel: {
                                rotate: 45,
                                fontWeight: "bold",
                                fontSize: 12
                              }
                            }
                      ],
                      series: [
                            {
                                name: 'Appointments:',
                                type: 'bar',
                                data: [${dataList['dailyAppointmentAsyncsValue']}]
                            }
                      ]
                  } 
                    ''',
                  theme: "light",
                ),
              ),

              SpaceHeight_XXXXXL,
            ],
          ),
        );
      },
    );
  }
}
