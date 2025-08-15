export default function handler(req, res) {
  res.status(200).json({
    message: "871d71c8923bc8890741",
    timestamp: new Date().toISOString(),
  });
}