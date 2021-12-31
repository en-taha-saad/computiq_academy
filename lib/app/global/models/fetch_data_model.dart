class Profile {
  User? user;
  List<Course>? course;
  String? photo;

  Profile({
    this.user,
    this.course,
    this.photo,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(Course.fromJson(v));
      });
    }
    photo = json['photo'];
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
}

class Course {
  int? id;
  String? title;
  int? duration;
  String? level;
  String? image;
  List<Tasks>? tasks;

  Course({
    this.id,
    this.title,
    this.duration,
    this.level,
    this.image,
    this.tasks,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    level = json['level'];
    image = json['image'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
      });
    }
  }
}

class Tasks {
  String? id;
  String? title;
  String? description;

  Tasks({
    this.id,
    this.title,
    this.description,
  });

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }
}

class CourseDetails {
  int? id;
  String? title;
  List<Weeks>? weeks;

  CourseDetails({this.id, this.title, this.weeks});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['weeks'] != null) {
      weeks = <Weeks>[];
      json['weeks'].forEach((v) {
        weeks?.add(Weeks.fromJson(v));
      });
    }
  }
}

class Weeks {
  String? id;
  String? title;
  List<Videos>? videos;

  Weeks({this.id, this.title, this.videos});

  Weeks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos?.add(Videos.fromJson(v));
      });
    }
  }
}

class Videos {
  String? videoId;
  String? title;

  Videos({this.videoId, this.title});

  Videos.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    title = json['title'];
  }
}
