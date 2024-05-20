import 'package:events_app/features/common/data/models/comment_model.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/models/user_model.dart';

List<EventModel> mockEvents = [
  EventModel(
    id: "123456",
    name: "Picasso Event No#001",
    date: DateTime(2024, 5, 5, 22, 30).toString(),
    time: DateTime(2024, 5, 5, 22, 30).toString(),
    location: "Parque dos Poetas",
    type: "Event Type",
    organizationName: "Picasso Eventos",
    donationMethods: "Mobile Wallets and Bank Deposit",
    donationGoal: 100000.toString(),
    donationProgress: 1000.toString(),
    description: "A very long event description",
  ),
  /* EventModel(
    id: "123456",
    name: "Picasso Event No#001",
    date: DateTime(2024, 5, 5, 22, 30),
    time: DateTime(2024, 5, 5, 22, 30),
    location: "Parque dos Poetas",
    type: "Event Type",
    organizationName: "Picasso Eventos",
    donationMethods: "Mobile Wallets and Bank Deposit",
    donationGoal: 100000,
    donationProgress: 1000,
    description: "A very long event description",
  ),
  EventModel(
    id: "82538",
    name: "Picasso Event No#002",
    date: DateTime(2024, 5, 5, 22, 30),
    time: DateTime(2024, 5, 5, 22, 30),
    location: "Parque dos Poetas",
    type: "Event Type",
    organizationName: "Picasso Eventos",
    donationMethods: "Mobile Wallets and Bank Deposit",
    donationGoal: 100000,
    donationProgress: 1000,
    description: "A very long event description",
  ),
  EventModel(
    id: "275687",
    name: "Picasso Event No#003",
    date: DateTime(2024, 5, 5, 22, 30),
    time: DateTime(2024, 5, 5, 22, 30),
    location: "Parque dos Poetas",
    type: "Event Type",
    organizationName: "Picasso Eventos",
    donationMethods: "Mobile Wallets and Bank Deposit",
    donationGoal: 100000,
    donationProgress: 1000,
    description: "A very long event description",
  ), */
];

List<CommentModel> mockComments = [
  const CommentModel(
    id: "32985789357",
    eventId: "123456",
    userId: "7562893756",
    content: "Fantastic event, very excited to go!",
  ),
  const CommentModel(
    id: "32985789357",
    eventId: "123456",
    userId: "7562893756",
    content: "Can't wait to go!",
  ),
  const CommentModel(
    id: "32985789357",
    eventId: "123456",
    userId: "7562893756",
    content: "Last year's was lame!",
  ),
];

UserModel mockNormalUser = const UserModel(
  id: "123456",
  name: "Musk",
  email: "musk@mail.com",
  designation: UserDesignation.Normal,
);

UserModel mockOrgUser = const UserModel(
  id: "1234564",
  name: "Elon",
  email: "elon@mail.com",
  designation: UserDesignation.Organization,
);
