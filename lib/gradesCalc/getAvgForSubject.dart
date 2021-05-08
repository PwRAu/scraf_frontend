double getAvgForSubject(List<double> voti) {
  double avg;
  double tot = 0;
  //print(voti);
  for (int i = 0; i < voti.length; i++) {
    tot += voti[i];
  }
  avg = tot / voti.length;
  //print(avg);
  return avg;
}
