import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dailyseries_page_model.dart';
export 'dailyseries_page_model.dart';

class DailyseriesPageWidget extends StatefulWidget {
  const DailyseriesPageWidget({
    super.key,
    required this.backgroundColor1,
    required this.backgroundColor2,
  });

  final Color? backgroundColor1;
  final Color? backgroundColor2;

  @override
  State<DailyseriesPageWidget> createState() => _DailyseriesPageWidgetState();
}

class _DailyseriesPageWidgetState extends State<DailyseriesPageWidget> {
  late DailyseriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailyseriesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<SeriesRecord>>(
      stream: querySeriesRecord(
        queryBuilder: (seriesRecord) => seriesRecord
            .where(
              'date',
              isGreaterThanOrEqualTo:
                  functions.getDayStart(getCurrentTimestamp),
            )
            .where(
              'date',
              isLessThanOrEqualTo: functions.getDayEnd(getCurrentTimestamp),
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<SeriesRecord> dailyseriesPageSeriesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final dailyseriesPageSeriesRecord =
            dailyseriesPageSeriesRecordList.isNotEmpty
                ? dailyseriesPageSeriesRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 270.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          valueOrDefault<Color>(
                            widget!.backgroundColor1,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          valueOrDefault<Color>(
                            widget!.backgroundColor2,
                            FlutterFlowTheme.of(context).secondary,
                          )
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 74.0, 24.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: valueOrDefault<Color>(
                                  widget!.backgroundColor2,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                  FFAppState().randomnumber = 0;
                                  FFAppState().currentpage = 1;
                                  FFAppState().userscore = 0;
                                  FFAppState().iscorrect = '';
                                  FFAppState().selectedindex = -1;
                                  FFAppState().selectedanswer = [];
                                  FFAppState().isanswered = false;
                                  FFAppState().correctanswer = '';
                                  safeSetState(() {});
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'u2pr21wo' /* Question  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().currentpage.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'vo03gzhi' /*  / 10 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dailyseriesPageSeriesRecord?.title,
                                  'Titre de la série',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 24.0, 32.0, 24.0),
                      child: StreamBuilder<List<QuestionsRecord>>(
                        stream: queryQuestionsRecord(
                          queryBuilder: (questionsRecord) => questionsRecord
                              .where(
                                'serie',
                                isEqualTo:
                                    dailyseriesPageSeriesRecord?.reference.id,
                              )
                              .where(
                                'number',
                                isEqualTo: FFAppState().currentpage,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<QuestionsRecord> listViewQuestionsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final listViewQuestionsRecord =
                              listViewQuestionsRecordList.isNotEmpty
                                  ? listViewQuestionsRecordList.first
                                  : null;

                          return ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowAdBanner(
                                  width: 320.0,
                                  height: 50.0,
                                  showsTestAd: false,
                                  iOSAdUnitID:
                                      'ca-app-pub-5902757634604822/8533755275',
                                  androidAdUnitID:
                                      'ca-app-pub-5902757634604822/6177382805',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              listViewQuestionsRecord?.question,
                                              'Question',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'g7uvitgf' /* Choisissez la bonne réponse pa... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowAdBanner(
                                  width: 320.0,
                                  height: 50.0,
                                  showsTestAd: false,
                                  iOSAdUnitID:
                                      'ca-app-pub-5902757634604822/2605769031',
                                  androidAdUnitID:
                                      'ca-app-pub-5902757634604822/3600719728',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: Builder(
                                  builder: (context) {
                                    final answers = listViewQuestionsRecord
                                            ?.answers
                                            ?.toList() ??
                                        [];

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: answers.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 15.0),
                                      itemBuilder: (context, answersIndex) {
                                        final answersItem =
                                            answers[answersIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (FFAppState().isanswered ==
                                                false) {
                                              FFAppState().addToSelectedanswer(
                                                  answersItem);
                                              FFAppState().isanswered = true;
                                              safeSetState(() {});
                                              FFAppState().iscorrect =
                                                  answersItem;
                                              safeSetState(() {});
                                              FFAppState().selectedindex =
                                                  answersIndex;
                                              safeSetState(() {});
                                              FFAppState().correctanswer =
                                                  listViewQuestionsRecord!
                                                      .correct;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                () {
                                                  if ((FFAppState()
                                                              .selectedindex ==
                                                          answersIndex) &&
                                                      (FFAppState().iscorrect ==
                                                          listViewQuestionsRecord
                                                              ?.correct)) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if ((FFAppState()
                                                              .selectedindex ==
                                                          answersIndex) &&
                                                      (FFAppState().iscorrect !=
                                                          listViewQuestionsRecord
                                                              ?.correct)) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground;
                                                  }
                                                }(),
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    answersItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowAdBanner(
                                  width: 320.0,
                                  height: 50.0,
                                  showsTestAd: false,
                                  iOSAdUnitID:
                                      'ca-app-pub-5902757634604822/3979432596',
                                  androidAdUnitID:
                                      'ca-app-pub-5902757634604822/1110287758',
                                ),
                              ),
                              if (FFAppState().isanswered == true)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 20.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '69cq75n1' /* La bonne réponse est :  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  FFAppState().correctanswer,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().currentpage < 10)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if (FFAppState().iscorrect ==
                                                    listViewQuestionsRecord
                                                        ?.correct) {
                                                  FFAppState().userscore =
                                                      FFAppState().userscore +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                if (FFAppState().currentpage <
                                                    10) {
                                                  FFAppState().currentpage =
                                                      FFAppState().currentpage +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                FFAppState().selectedindex = -1;
                                                FFAppState().isanswered = false;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                's8oq5get' /* Question suivante */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          if (FFAppState().currentpage == 10)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if (FFAppState().iscorrect ==
                                                    listViewQuestionsRecord
                                                        ?.correct) {
                                                  FFAppState().userscore =
                                                      FFAppState().userscore +
                                                          1;
                                                  safeSetState(() {});
                                                }

                                                context.pushNamed(
                                                  'resultsPage',
                                                  queryParameters: {
                                                    'quiztitle': serializeParam(
                                                      dailyseriesPageSeriesRecord
                                                          ?.title,
                                                      ParamType.String,
                                                    ),
                                                    'score': serializeParam(
                                                      FFAppState().userscore,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'f0tizuyw' /* Passer aux résultats */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 15.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
