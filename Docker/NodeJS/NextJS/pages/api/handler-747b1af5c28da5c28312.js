export default function handler(req, res) {
  res.status(200).json({
    message: "747b1af5c28da5c28312",
    timestamp: new Date().toISOString(),
  });
}