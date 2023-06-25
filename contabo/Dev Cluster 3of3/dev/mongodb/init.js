var rsConfig = {
  _id: "hl1",
  members: [
    { _id: 0, host: "hl_second_mongo1", priority: 1},
    { _id: 1, host: "hl_second_mongo2", priority: 2},
    //{ _id: 2, host: "hl_second_mongo3:27017", priority: 2}
]
};

while (rs.initiate(rsConfig).ok === 0) {
  sleep(100);
}

rs.status();
