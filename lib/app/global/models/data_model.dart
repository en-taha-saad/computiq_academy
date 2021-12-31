// class Data {
//   Profile? profile;
//   Token? token;

//   Data({this.profile, this.token});

//   Data.fromJson(Map<String, dynamic> json) {
//     profile =
//         json['profile'] != null ? Profile?.fromJson(json['profile']) : null;
//     token = json['token'] != null ? Token?.fromJson(json['token']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (profile != null) {
//       data['profile'] = profile!.toJson();
//     }
//     if (token != null) {
//       data['token'] = token!.toJson();
//     }
//     return data;
//   }
// }

// class Profile {
//   User? user;
//   List<Course>? course;
//   String? photo;

//   Profile({this.user, this.course, this.photo});

//   Profile.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User?.fromJson(json['user']) : null;
//     if (json['course'] != null) {
//       course = <Course>[];
//       json['course'].forEach((v) {
//         course!.add(Course.fromJson(v));
//       });
//     }
//     photo = json['photo'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (user != null) {
//       data['user'] = user?.toJson();
//     }
//     if (course != null) {
//       data['course'] = course!.map((v) => v.toJson()).toList();
//     }
//     data['photo'] = photo;
//     return data;
//   }
// }

// class User {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;

//   User({this.id, this.firstName, this.lastName, this.email});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['email'] = email;
//     return data;
//   }
// }

// class Course {
//   int? id;
//   String? title;
//   int? duration;
//   String? level;
//   String? effort;
//   int? price;
//   int? discount;
//   String? subject;
//   String? englishLevel;
//   String? description;
//   String? whatYouLearn;
//   bool? isPublished;
//   bool? isMultiModule;
//   String? image;
//   List<Instructors>? instructors;
//   String? status;
//   String? link;
//   Category? category;
//   String? programDate;
//   Timeline? timeline;
//   String? note;
//   List<Tasks>? tasks;

//   Course(
//       {this.id,
//       this.title,
//       this.duration,
//       this.level,
//       this.effort,
//       this.price,
//       this.discount,
//       this.subject,
//       this.englishLevel,
//       this.description,
//       this.whatYouLearn,
//       this.isPublished,
//       this.isMultiModule,
//       this.image,
//       this.instructors,
//       this.status,
//       this.link,
//       this.category,
//       this.programDate,
//       this.timeline,
//       this.note,
//       this.tasks});

//   Course.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     duration = json['duration'];
//     level = json['level'];
//     effort = json['effort'];
//     price = json['price'];
//     discount = json['discount'];
//     subject = json['subject'];
//     englishLevel = json['english_level'];
//     description = json['description'];
//     whatYouLearn = json['what_you_learn'];
//     isPublished = json['is_published'];
//     isMultiModule = json['is_multi_module'];
//     image = json['image'];
//     if (json['instructors'] != null) {
//       instructors = <Instructors>[];
//       json['instructors'].forEach((v) {
//         instructors!.add(Instructors.fromJson(v));
//       });
//     }

//     status = json['status'];
//     link = json['link'];
//     category =
//         json['category'] != null ? Category?.fromJson(json['category']) : null;
//     programDate = json['program_date'];
//     timeline =
//         json['timeline'] != null ? Timeline?.fromJson(json['timeline']) : null;
//     note = json['note'];
//     if (json['tasks'] != null) {
//       tasks = <Tasks>[];
//       json['tasks'].forEach((v) {
//         tasks!.add(Tasks.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['duration'] = duration;
//     data['level'] = level;
//     data['effort'] = effort;
//     data['price'] = price;
//     data['discount'] = discount;
//     data['subject'] = subject;
//     data['english_level'] = englishLevel;
//     data['description'] = description;
//     data['what_you_learn'] = whatYouLearn;
//     data['is_published'] = isPublished;
//     data['is_multi_module'] = isMultiModule;
//     data['image'] = image;
//     if (instructors != null) {
//       data['instructors'] = instructors!.map((v) => v.toJson()).toList();
//     }

//     data['status'] = status;
//     data['link'] = link;
//     if (category != null) {
//       data['category'] = category?.toJson();
//     }
//     data['program_date'] = programDate;
//     if (timeline != null) {
//       data['timeline'] = timeline?.toJson();
//     }
//     data['note'] = note;
//     if (tasks != null) {
//       data['tasks'] = tasks!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Instructors {
//   int? id;
//   String? photo;
//   String? name;
//   String? position;
//   bool? isActive;
//   String? detail;

//   Instructors(
//       {this.id,
//       this.photo,
//       this.name,
//       this.position,
//       this.isActive,
//       this.detail});

//   Instructors.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     photo = json['photo'];
//     name = json['name'];
//     position = json['position'];
//     isActive = json['is_active'];
//     detail = json['detail'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['photo'] = photo;
//     data['name'] = name;
//     data['position'] = position;
//     data['is_active'] = isActive;
//     data['detail'] = detail;
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? title;
//   String? image;

//   Category({this.id, this.title, this.image});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['image'] = image;
//     return data;
//   }
// }

// class Timeline {
//   List<Days>? days;

//   Timeline({this.days});

//   Timeline.fromJson(Map<String, dynamic> json) {
//     if (json['days'] != null) {
//       days = <Days>[];
//       json['days'].forEach((v) {
//         days!.add(Days.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (days != null) {
//       data['days'] = days!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Days {
//   String? day;
//   String? from;
//   String? to;

//   Days({this.day, this.from, this.to});

//   Days.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     from = json['from'];
//     to = json['to'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['day'] = day;
//     data['from'] = from;
//     data['to'] = to;
//     return data;
//   }
// }

// class Tasks {
//   String? id;
//   String? title;
//   String? description;

//   Tasks({this.id, this.title, this.description});

//   Tasks.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     return data;
//   }
// }

// class Token {
//   String? accessToken;
//   String? tokenType;

//   Token({this.accessToken, this.tokenType});

//   Token.fromJson(Map<String, dynamic> json) {
//     accessToken = json['access_token'];
//     tokenType = json['token_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['access_token'] = accessToken;
//     data['token_type'] = tokenType;
//     return data;
//   }
// }
