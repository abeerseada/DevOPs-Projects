export default function handler(req, res) {
  res.status(200).json({
    message: "9e2ba1ebb4eba04915aa",
    timestamp: new Date().toISOString(),
  });
}