import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/NoteController.dart';
import '../../../../models/NoteModel.dart';
import '../../../../models/PatientModel.dart';
import '../../../../utils/SizeandStyleUtills.dart';
import '../../../../utils/SizesStatic.dart';
import '../../../../widgets/OnceFutureBuilder.dart';
import '../../../ThemeColors.dart';

class NotesTab extends StatefulWidget {
  final PatientModel? patient;

  const NotesTab({Key? key, this.patient}) : super(key: key);

  @override
  _NotesTabState createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> {
  late Size scrennSize;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    scrennSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider.value(
      value: NoteController(),
      child: Consumer<NoteController>(
        builder:
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await model.getNotes(widget.patient?.patientId ?? '');
                    },
                    child: OnceFutureBuilder(
                      future:
                          () => model.getNotes(widget.patient?.patientId ?? ''),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container(
                            height: SizeandStyleUtills().screenHeight,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else {
                          model.notes = snapshot.data as List<NoteModel>;
                          return SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [listOFData(context, model)],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 15,
                                    bottom: 11,
                                    top: 11,
                                    right: 15,
                                  ),
                                  hintText: S().Notes,
                                ),
                                controller: model.noteController,
                                validator: (value) {
                                  return value?.isEmpty ?? true
                                      ? "Add note First"
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    model.isLoading
                        ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeColors.primary,
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ThemeColors.primary,
                            ),
                          ),
                        )
                        : Container(
                          margin: EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                NoteModel noteModel = NoteModel();
                                noteModel.comments = model.noteController.text;
                                setState(() {
                                  model.isLoading = true;
                                });
                                bool status = await NoteController().saveNotes(
                                  note: noteModel,
                                  patientId: widget.patient?.patientId ?? '',
                                );
                                if (status) {
                                  model.notes.clear();
                                  model.noteController.clear();
                                  model.notes.addAll(
                                    await model.getNotes(
                                      widget.patient?.patientId ?? '',
                                    ),
                                  );
                                  model.isLoading = false;
                                  setState(() {});
                                }
                              }
                            },
                            child: Icon(Icons.send_rounded),
                          ),
                        ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget listOFData(context, NoteController model) {
    return Container(
      height: scrennSize.height,
      child:
          model.isLoading
              ? Center(child: CircularProgressIndicator())
              : model.notes.isEmpty
              ? Center(
                child: EmptyScreenWidget(
                  assetPath: AssetsRoutes.noBoxDataAvailable,
                ),
              )
              : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 15),
                itemCount: model.notes.length,
                itemBuilder: (context, index) {
                  NoteModel modeln = model.notes[index];
                  return itemWidget(modeln);
                },
              ),
    );
  }

  Widget itemWidget(NoteModel noteModel) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceWidth_M,
              Column(
                children: [
                  CircleAvatar(child: Icon(Icons.article_rounded)),
                  Container(height: 80, width: 3, color: Colors.grey[200]),
                ],
              ),
              SpaceWidth_M,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceHeight_S,
                  Text(
                    noteModel.comments ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SpaceHeight_XS,
                  Container(
                    width: SizeandStyleUtills().getProportionalWidth(
                      width: 300,
                    ),
                    child: Text(
                      noteModel.createdBy ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SpaceHeight_S,
                  Container(
                    child: Row(
                      children: [
                        Text(
                          DateFormat(
                            "dd/MM/yyyy hh:mm",
                          ).format(noteModel.creationDate!),
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
