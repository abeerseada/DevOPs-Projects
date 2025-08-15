export default function handler(req, res) {
  res.status(200).json({
    message: "77ee5972c5cf1892bd10",
    timestamp: new Date().toISOString(),
  });
}