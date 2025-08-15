export default function handler(req, res) {
  res.status(200).json({
    message: "106fb762143edd931992",
    timestamp: new Date().toISOString(),
  });
}