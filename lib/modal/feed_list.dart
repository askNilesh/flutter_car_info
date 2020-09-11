class FeedData {
  String userPhoto;
  String userName;
  String timeStamp;
  String postDescription;
  String postImage;
  bool isLiked;

  FeedData(
      {this.userPhoto,
      this.userName,
      this.timeStamp,
      this.postDescription,
      this.postImage,
      this.isLiked = false});
}

var alex = FeedData(
    userName: 'Alex Suprun',
    userPhoto:
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
    timeStamp: '30 min ago',
    postDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    postImage:
        'https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');

var ed = FeedData(
    userName: 'Ed Pylypenko',
    userPhoto:
        'https://images.unsplash.com/flagged/photo-1573740144655-bbb6e88fb18a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    timeStamp: '30 min ago',
    postDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    postImage:
        'https://images.unsplash.com/photo-1570633545582-cd25ed6e8497?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60');

var austin = FeedData(
    userName: 'Austin Distel',
    userPhoto:
        'https://images.unsplash.com/photo-1526948128573-703ee1aeb6fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80  ',
    timeStamp: '30 min ago',
    postDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    postImage:
        'https://images.unsplash.com/photo-1514575110897-1253ff7b2ccb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80');

var christopher = FeedData(
    userName: 'Christopher Campbell',
    userPhoto:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    timeStamp: '30 min ago',
    postDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    postImage:
        'https://images.unsplash.com/photo-1489875347897-49f64b51c1f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');

var campbell = FeedData(
    userName: 'Štefan Štefančík',
    userPhoto:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
    timeStamp: '30 min ago',
    postDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    postImage:
        'https://images.unsplash.com/photo-1527335480088-278dbeec0ad5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');

List<FeedData> feedList = [alex, ed, austin, christopher, campbell,alex, ed, austin, christopher, campbell];
