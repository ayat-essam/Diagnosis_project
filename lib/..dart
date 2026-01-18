class  {
	int? monday;

	({this.monday});

	factory .fromJson(Map<String, dynamic> json) => (
				monday: json['Monday'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'Monday': monday,
			};
}
