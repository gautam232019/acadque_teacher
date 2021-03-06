import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/available_slot/available_slots_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AvailableSlots extends StatelessWidget {
  const AvailableSlots({Key? key}) : super(key: key);

  String getMonth(int month) {
    String newMonth = "";
    switch (month) {
      case 1:
        newMonth = "Jan";
        break;
      case 2:
        newMonth = "Feb";
        break;
      case 3:
        newMonth = "Mar";
        break;
      case 4:
        newMonth = "Apr";
        break;
      case 5:
        newMonth = "May";
        break;
      case 6:
        newMonth = "Jun";
        break;
      case 7:
        newMonth = "Jul";
        break;
      case 8:
        newMonth = "Aug";
        break;
      case 9:
        newMonth = "Sep";
        break;
      case 10:
        newMonth = "Oct";
        break;
      case 11:
        newMonth = "Nov";
        break;
      case 12:
        newMonth = "Dec";
        break;
    }

    return newMonth;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final state = Provider.of<AvailableSlotsState>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/svg/arrow_back.svg'),
                        )),
                    const Text(
                      'Available Slots',
                      style: TextStyle(
                          fontSize: 20,
                          color: colorWhite,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    const Text('')
                  ],
                ),
              ),
              height: size * 0.2,
              decoration: const BoxDecoration(
                color: Color(0xFF59AEFD),
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_dark.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero)),
                height: size * 0.8,
                child: state.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Select your available slots',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Roboto'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SfDateRangePicker(
                                  onSelectionChanged: (val) {
                                    state.onDateTimeSelect(val.value);
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  mWidthSpan,
                                  Text(
                                    "Appointment dates:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              if (state.teacherScheduleState!.data!.schedules!
                                  .isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children: state
                                        .teacherScheduleState!.data!.schedules!
                                        .map((e) {
                                      return Wrap(
                                        children: e.days!
                                            .map(
                                              (ee) => Container(
                                                margin: const EdgeInsets.all(4),
                                                padding:
                                                    const EdgeInsets.all(4),
                                                color: Colors.blue
                                                    .withOpacity(0.6),
                                                child: Text(
                                                  "${getMonth(e.month!)} ${ee.toString()}, ",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  mWidthSpan,
                                  Text(
                                    "Selected Dates:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: state.selectedDates
                                      .map(
                                        (e) => InkWell(
                                          onTap: () {
                                            state.onRemoveSelectedDate(e);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(4),
                                            padding: const EdgeInsets.all(4),
                                            color: Colors.blue.withOpacity(0.6),
                                            child: Text(
                                              Jiffy(e).format("MMM dd"),
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              sHeightSpan,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'From',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final result = await showTimePicker(
                                              context: context,
                                              initialTime: const TimeOfDay(
                                                  hour: 8, minute: 0),
                                              builder: (context, child) {
                                                return MediaQuery(
                                                    data: MediaQuery.of(context)
                                                        .copyWith(
                                                            alwaysUse24HourFormat:
                                                                true),
                                                    child:
                                                        child ?? Container());
                                              });
                                          if (result == null) return;
                                          state.onStartTimeChange(result);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 155,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: colorGrey),
                                          child: Center(
                                            child: state.startTime != null
                                                ? Text(
                                                    Jiffy(
                                                      DateTime(
                                                        DateTime.now().year,
                                                        DateTime.now().month,
                                                        DateTime.now().day,
                                                        state.startTime!.hour,
                                                        state.startTime!.minute,
                                                      ),
                                                    ).format("hh:mm a"),
                                                  )
                                                : const Text("Not Selected"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'To',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: state.startTime != null
                                            ? () async {
                                                final result =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            const TimeOfDay(
                                                                hour: 17,
                                                                minute: 0),
                                                        builder:
                                                            (context, child) {
                                                          return MediaQuery(
                                                              data: MediaQuery.of(
                                                                      context)
                                                                  .copyWith(
                                                                      alwaysUse24HourFormat:
                                                                          true),
                                                              child: child ??
                                                                  Container());
                                                        });
                                                if (result == null) return;
                                                state.onEndTimeChange(result);
                                              }
                                            : null,
                                        child: Container(
                                          height: 50,
                                          width: 155,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: colorGrey),
                                          child: Center(
                                            child: state.endTime != null
                                                ? Text(
                                                    Jiffy(
                                                      DateTime(
                                                        DateTime.now().year,
                                                        DateTime.now().month,
                                                        DateTime.now().day,
                                                        state.endTime!.hour,
                                                        state.endTime!.minute,
                                                      ),
                                                    ).format("hh:mm a"),
                                                  )
                                                : const Text("Not Selected"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      state.onSubmit(context);
                                    },
                                    child: Row(
                                      children: [
                                        if (state.loading)
                                          const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        xsWidthSpan,
                                        const Text("Save"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
