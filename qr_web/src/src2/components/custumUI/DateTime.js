import { useEffect, useState } from "react";

function DateTime() {
  const [dateTime, setDateTime] = useState("");

  useEffect(() => {
    const now = new Date();
    setDateTime(now.toLocaleString());
  }, []);

  return <time dateTime={dateTime}>{dateTime}</time>;
}

export default DateTime;
