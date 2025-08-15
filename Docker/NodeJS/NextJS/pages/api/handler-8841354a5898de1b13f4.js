export default function handler(req, res) {
  res.status(200).json({
    message: "8841354a5898de1b13f4",
    timestamp: new Date().toISOString(),
  });
}