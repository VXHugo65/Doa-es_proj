// ignore_for_file: use_build_context_synchronously

import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/utils/custom_snackbar.dart';
import 'package:events_app/core/utils/mock_data.dart';
import 'package:events_app/core/utils/random_id.dart';
import 'package:events_app/features/common/data/models/comment_model.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories_impl/comment_repository_impl.dart';
import 'package:flutter/material.dart';

import '../widgets/event_detail_row.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({
    super.key,
    required this.event,
    required this.user,
  });

  final EventModel event;
  final UserModel user;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final CommentRepositoryImpl _eventRepositoryImpl = CommentRepositoryImpl();
  List<CommentModel> comments = List<CommentModel>.empty(growable: true);
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    _fetchComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.name),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => _buildDialog(context),
            ),
            icon: const Icon(Icons.comment),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _buildDetailsBLock(),
              const SizedBox(height: 15),
              comments.isEmpty
                  ? const Text("No Comments")
                  : Text("${comments.length} Comments"),
              const Divider(height: 10),
              Expanded(child: _buildCommentView()),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchComments() async {
    DataState<List<CommentModel>> res = await _eventRepositoryImpl.read();
    if (res is DataSuccess) {
      setState(() {
        comments = res.data!;
      });
    } else {
      setState(() {
        comments = mockComments;
      });
      showCustomSnackBar(context, res.error!.message!);
    }
  }

  AlertDialog _buildDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Comment'),
      content: TextField(
        controller: commentController,
        decoration: const InputDecoration(hintText: "Write your comment here"),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Publish'),
          onPressed: () => _publishComment(context),
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Future<void> _publishComment(BuildContext context) async {
    CommentRepositoryImpl repo = CommentRepositoryImpl();
    CommentModel comment = CommentModel(
      id: randomId().toString(),
      eventId: widget.event.id,
      userId: widget.user.id,
      content: commentController.text,
    );
    DataState<bool> res = await repo.create(comment);
    if (res is DataSuccess) {
      showCustomSnackBar(context, "Comment created successfully!");
    } else {
      showCustomSnackBar(context, "Unexpected error!");
    }
    Navigator.of(context).pop(commentController.text);
  }

  RefreshIndicator _buildCommentView() {
    return RefreshIndicator(
      onRefresh: () => _fetchComments(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(comments[index].content),
            subtitle: const Text("@Anonymous"),
            subtitleTextStyle: const TextStyle(
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          );
        },
      ),
    );
  }

  Padding _buildDetailsBLock() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "Save the date  ${widget.event.date}",
                    // "Save the date  ${widget.event.date.day}/${widget.event.date.month}/${widget.event.date.year} - ${widget.event.date.hour}:${widget.event.date.minute}",
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              EventDetailRow(
                label: 'Location',
                detail: widget.event.location,
              ),
              const SizedBox(height: 10),
              EventDetailRow(
                label: 'Event Type',
                detail: widget.event.type,
              ),
              const SizedBox(height: 10),
              EventDetailRow(
                label: 'Organization Name',
                detail: widget.event.organizationName,
              ),
              const SizedBox(height: 10),
              EventDetailRow(
                label: 'Donation Methods',
                detail: widget.event.donationMethods,
              ),
              const SizedBox(height: 10),
              Text("Donation Goal:  ${widget.event.donationGoal}"),
              EventDetailRow(
                label: 'Event Type',
                detail: widget.event.type,
              ),
              const SizedBox(height: 10),
              EventDetailRow(
                label: 'Event Donation Progress',
                detail: widget.event.donationProgress.toString(),
              ),
              const SizedBox(height: 10),
              EventDetailRow(
                label: 'Event Donation Description',
                detail: widget.event.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
