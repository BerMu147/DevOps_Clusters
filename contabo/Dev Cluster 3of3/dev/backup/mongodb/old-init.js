var rsConfig = {
 _id: "rs0",
 members: [
   { _id: 0, host: "mongo1:27017", priority: 1},
  //{ _id: 1, host: "mongo2:27018", priority: 2},
  //{ _id: 2, host: "mongo3:27019", priority: 3}
 ]
};

while (rs.initiate(rsConfig).ok === 0) {
 sleep(100);
}